# frozen_string_literal: true

require 'json'
require_relative '../../lib/extraction/invoice_extractor'

RSpec.describe Extraction::InvoiceExtractor do
  it 'responds to extract' do
    extractor = described_class.new
    expect(extractor).to respond_to(:extract)
  end
end
