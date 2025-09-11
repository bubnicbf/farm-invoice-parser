# frozen_string_literal: true

require "json"
require "json_schemer"
require "ruby_llm"

module Extraction
  class InvoiceExtractor
    SCHEMA = JSON.parse(File.read(File.expand_path("../../config/invoice_schema.json", __dir__)))
    SCHEMER = JSONSchemer.schema(SCHEMA)

    def initialize(provider: :openai, model: "gpt-4o-mini")
      @provider = provider
      @model = model
    end

    def extract(ocr_text:)
      system_prompt = <<~PROMPT
        You are a precise invoice parser for small farm handwritten/printed invoices.
        Return ONLY valid JSON matching the provided JSON Schema. No markdown.
        If data is missing, leave blank or best-effort, but never invent totals that contradict line math.
        Normalize currency to ISO code (e.g., USD). Units: lb, kg, bu, gal, each.
      PROMPT

      user_prompt = <<~PROMPT
        OCR TEXT:
        #{ocr_text}

        JSON SCHEMA:
        #{SCHEMA.to_json}
      PROMPT

      response = RubyLLM.chat(
        provider: @provider,
        model: @model,
        messages: [
          { role: "system", content: system_prompt },
          { role: "user", content: user_prompt }
        ],
        response_format: :json # if supported by your selected provider/model
      )

      parsed = JSON.parse(response.content)
      validate!(parsed)
      reconcile!(parsed)
      parsed
    rescue JSON::ParserError => e
      warn "JSON parse error: #{e.message}"
      nil
    end

    private

    def validate!(json)
      errs = SCHEMER.validate(json).to_a
      raise "Schema validation failed: #{errs.inspect}" unless errs.empty?
    end

    def reconcile!(json)
      sum_lines = (json["lines"] || []).sum { |l| l["line_total"].to_f }
      json["totals"]["subtotal"] ||= sum_lines.round(2)

      expected = json["totals"]["subtotal"].to_f + json["totals"]["tax"].to_f
      if (json["totals"]["grand_total"].to_f - expected).abs > 0.05
        json["notes"] = [json["notes"], "Totals mismatch; needs review"].compact.join(" | ")
      end
    end
  end
end
