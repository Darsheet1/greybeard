# Contributing

Thanks for your interest in contributing to greybeard.

## Ways to contribute

- **Content packs** — the easiest and highest-value contribution
- **Bug reports** — open an issue with steps to reproduce
- **Feature requests** — open an issue describing the use case
- **Code** — see below for the development setup

---

## Development setup

```bash
git clone https://github.com/btotharye/greybeard.git
cd greybeard

# With uv (recommended)
uv pip install -e ".[dev]"

# Or with pip
pip install -e ".[dev]"
```

## Running tests

```bash
pytest

# With coverage
pytest --cov=staff_review --cov-report=term-missing
```

## Linting

```bash
ruff check .

# Auto-fix
ruff check . --fix
```

## Running docs locally

```bash
pip install -e ".[docs]"
mkdocs serve
```

Then open `http://localhost:8000`.

---

## Contributing a content pack

Content packs are the easiest contribution with the highest impact. Here's how:

1. Create a new `.yaml` file in `packs/`
2. Follow the [Pack Schema](reference/pack-schema.md)
3. Test it:
   ```bash
   git diff HEAD~1 | greybeard analyze --pack packs/your-pack.yaml
   ```
4. Open a PR with:
   - The pack file
   - A brief description of the perspective and when to use it
   - An example output (optional but appreciated)

### Pack ideas

Some perspectives that would make great packs:

- **Security engineer** — threat modeling, auth, secrets, injection
- **Data engineer** — schema design, migration safety, pipeline reliability
- **Mobile engineer** — client/server contract, versioning, offline behavior
- **Startup engineer** — speed vs quality tradeoffs, tech debt awareness
- **SRE** — SLOs, error budgets, toil reduction
- **Accessibility** — a11y impact of UI decisions

---

## Code contributions

### Before opening a PR

1. Run tests: `pytest`
2. Run lint: `ruff check .`
3. Add tests for new functionality
4. Update docs if adding new features

### Commit style

Small, logical commits. Commit messages in the format:

```
feat: add X
fix: handle Y edge case
docs: update Z
test: add tests for W
chore: update dependencies
```

### Branch naming

```
feat/my-feature
fix/the-bug-description
docs/update-mcp-guide
```

---

## Project structure

```
greybeard/
├── staff_review/
│   ├── cli.py          # Click CLI entry point
│   ├── analyzer.py     # Review engine + LLM dispatch
│   ├── modes.py        # Mode-specific system prompts
│   ├── packs.py        # Pack loader (built-in + remote)
│   ├── config.py       # Config management
│   ├── mcp_server.py   # MCP stdio server
│   └── models.py       # Data types
├── packs/              # Built-in content packs
├── docs/               # MkDocs documentation
├── tests/              # pytest tests
└── examples/           # Usage examples
```

---

## Questions?

Open an issue or start a discussion on GitHub.
