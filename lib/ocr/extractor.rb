# frozen_string_literal: true
module OCR
  ExtractResult = Struct.new(:text, :blocks, :confidence, keyword_init: true)

  class Extractor
    # Implementors must accept a file path or IO
    def extract(file_path:) # => OCR::ExtractResult
      raise NotImplementedError
    end
  end
end
