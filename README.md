# Farm Invoice Parser (RubyLLM)

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
