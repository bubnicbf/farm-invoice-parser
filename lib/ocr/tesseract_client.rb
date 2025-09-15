# frozen_string_literal: true

require 'rtesseract'
require 'mini_magick'
require 'tempfile'
require_relative 'extractor'

module OCR
  class TesseractClient < Extractor
    def initialize(language: 'eng', psm: 6, preprocess: true)
      @language = language
      @psm = psm        # page segmentation mode; 6 = Assume a single uniform block of text
      @preprocess = preprocess
    end

    def extract(file_path:)
      img_path = @preprocess ? preprocess_image(file_path) : file_path
      text = RTesseract.new(img_path, lang: @language, psm: @psm).to_s
      OCR::ExtractResult.new(text: text, blocks: nil, confidence: nil)
    ensure
      cleanup_temp(img_path) if @preprocess
    end

    private

    def preprocess_image(src)
      tmp = Tempfile.new(%w[ocr _pre.png])
      tmp.close
      image = MiniMagick::Image.open(src)
      image.auto_orient
      image.colorspace 'Gray'
      image.contrast
      image.normalize
      image.write tmp.path
      tmp.path
    end

    def cleanup_temp(path)
      File.delete(path) if path && File.exist?(path)
    end
  end
end
