# Contributing

Thank you for considering a contribution to **hello-py**! This guide covers
everything you need to get started.

## Setup

```bash
git clone https://github.com/anaskalt/hello-py.git
cd hello-py
make install
```

This syncs all dependency groups and installs pre-commit hooks so that linting,
formatting, type checking, and commit-message validation run automatically.

## Workflow

1. Create a branch from `main`.
2. Write your code and tests.
3. Run `make all` to verify lint, types, security, and tests pass.
4. Commit using [Conventional Commits](https://www.conventionalcommits.org/) (see below).
5. Open a pull request against `main`.

## Conventional Commits

Every commit message is validated by
[Commitizen](https://commitizen-tools.github.io/commitizen/). Use one of the
following prefixes:

| Prefix | Purpose |
| :--- | :--- |
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation only |
| `test:` | Adding or updating tests |
| `refactor:` | Code change with no fix or feature |
| `chore:` | Maintenance (deps, CI, config) |

Example: `feat: add retry logic to API client`

## Dependencies

```bash
uv add requests               # runtime dependency
uv add --group test httpx     # test group
uv add --group dev ipdb       # dev group
```

Always commit both `pyproject.toml` and `uv.lock` together.

## Quality Standards

Pre-commit hooks enforce all standards on every commit:

| Tool | Role |
| :--- | :--- |
| [Ruff](https://docs.astral.sh/ruff/) | Linting and formatting |
| [mypy](https://mypy.readthedocs.io/) | Strict type checking |
| [Bandit](https://bandit.readthedocs.io/) | Security analysis |
| [uv-secure](https://github.com/owenlamont/uv-secure) | Dependency vulnerability scanning |
| [pytest](https://docs.pytest.org/) | Tests with 80 % coverage minimum |

Run `make check` for static analysis and `make test` for the test suite.

## Documentation

If your change affects public API, update the docstrings (Google style) —
the API reference is auto-generated. To preview the docs locally:

```bash
make docs   # opens at http://127.0.0.1:8000
```
