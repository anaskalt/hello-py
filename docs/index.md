# hello-py

A modern, production-ready Python package template.

## Overview

hello-py provides a complete, opinionated development environment for Python
packages. It uses [Hatchling](https://hatch.pypa.io/) for building with automatic
versioning from git tags, [uv](https://docs.astral.sh/uv/) for fast dependency
management, and [Ruff](https://docs.astral.sh/ruff/) for linting and formatting.

Code quality is enforced by [mypy](https://mypy.readthedocs.io/) in strict mode and
[Bandit](https://bandit.readthedocs.io/) for security scanning. Testing uses
[pytest](https://docs.pytest.org/) with [coverage](https://coverage.readthedocs.io/)
and doctests.

CI/CD runs on [GitHub Actions](https://docs.github.com/en/actions) with a test matrix
across Python 3.10–3.13 on Linux, macOS, and Windows. Releases are published to
[PyPI](https://pypi.org/) via trusted publishers. Documentation is built with
[MkDocs Material](https://squidfunk.github.io/mkdocs-material/) and hosted on
[Read the Docs](https://readthedocs.org/).

## Quick Start

```bash
git clone https://github.com/anaskalt/hello-py.git
cd hello-py

make install        # sync environment + install hooks
make check          # lint + typecheck + security
make test           # tests with coverage
make all            # everything at once
```

Run `make help` for all available commands.
