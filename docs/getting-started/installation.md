# Installation

## Requirements

- Python 3.11 or higher
- An LLM backend (see [LLM Backends](../guides/backends.md))

## Install with pip

```bash
pip install greybeard
```

## Install from source

```bash
git clone https://github.com/btotharye/greybeard.git
cd greybeard
pip install -e .
```

## Install with uv (recommended)

[uv](https://github.com/astral-sh/uv) is a fast Python package manager. If you have it installed:

```bash
uv pip install greybeard
# or from source:
uv pip install -e .
```

## Optional extras

```bash
# Anthropic/Claude backend support
pip install "greybeard[anthropic]"

# Everything
pip install "greybeard[all]"
```

## Verify installation

```bash
greybeard --version
greybeard packs
```

## Next step

Run the setup wizard to configure your LLM backend:

```bash
greybeard init
```

Or jump straight to the [Quick Start](quickstart.md).
