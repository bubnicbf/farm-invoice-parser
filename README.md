# Farm Invoice Parser (RubyLLM)

- v0.1.0 MVP baseline

Parses handwritten/printed farm invoices → structured JSON → validated transactions.

## Quick start
```bash
git clone git@github.com:bubnicbf/farm-invoice-parser.git && cd farm-invoice-parser
bin/setup
bin/dev
```

### Env

- Create .env:
```bash
OPENAI_API_KEY=...
ANTHROPIC_API_KEY=...
```

- Run
```bash
ruby -r "./lib/farm_invoice_parser" -e "puts FarmInvoiceParser.hello"
```

- Test
```bash
bundle exec rspec
```

### OCR → Parse (end-to-end)

Prereqs (macOS):
```bash
brew install tesseract imagemagick
```

Run:
```bash
bin/parse_invoice path/to/invoice.jpg --provider openai --model gpt-4o-mini
# or just see the OCR text:
bin/parse_invoice path/to/invoice.jpg --ocr-only
```

## Continuous Integration

**Note:** CI is currently configured to skip linting (RuboCop) and tests (RSpec). This is temporary so that builds remain green while the project is scaffolded. Once API keys (OpenAI, Anthropic, Gemini) are set up and test configuration is in place, these steps will be re-enabled in `.github/workflows/ci.yml`.

