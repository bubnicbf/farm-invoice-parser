# frozen_string_literal: true
require_relative 'extractor'

module OCR
  class TesseractClient < Extractor
    def extract(file_path:)
      # TODO: call Tesseract here (gem or system call)
      text = File.read(file_path) rescue ''  # placeholder
      ExtractResult.new(text: text, blocks: [], confidence: nil)
    end
  end
end
