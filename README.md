# hello-py

**A modern, production-ready Python package template.**

[![CI](https://github.com/anaskalt/hello-py/actions/workflows/ci.yml/badge.svg)](https://github.com/anaskalt/hello-py/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/anaskalt/hello-py/branch/main/graph/badge.svg)](https://codecov.io/gh/anaskalt/hello-py)
[![Docs](https://readthedocs.org/projects/hello-py/badge/?version=latest)](https://hello-py.readthedocs.io)
[![PyPI](https://img.shields.io/pypi/v/hello-py)](https://pypi.org/project/hello-py/)
[![Python](https://img.shields.io/pypi/pyversions/hello-py)](https://pypi.org/project/hello-py/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

An opinionated starter template that wires together modern Python tooling so you can
skip the boilerplate and start writing code.

Clone it, run `make install`, and you get linting, type checking, security scanning,
testing, documentation, CI/CD, and PyPI publishing — all configured and ready to go.

## Table of Contents

- [Quick Start](#quick-start)
- [Features](#features)
- [Usage](#usage)
- [Project Layout](#project-layout)
- [Versioning](#versioning)
- [Using This Template](#using-this-template)
- [Contributing](#contributing)
- [License](#license)

## Quick Start

```bash
git clone https://github.com/anaskalt/hello-py.git
cd hello-py
make install
```

This syncs all dependencies, installs pre-commit hooks, and sets up the full
development environment.

Run `make help` to see every available command.

## Features

### Build & Packaging

| Tool | Description |
| --- | --- |
| [Hatchling](https://hatch.pypa.io/) | Build backend with [hatch-vcs](https://github.com/ofek/hatch-vcs) for automatic git-based versioning |
| [uv](https://docs.astral.sh/uv/) | Dependency management with [PEP 735](https://peps.python.org/pep-0735/) dependency groups and committed lockfile |

### Code Quality

| Tool | Description |
| --- | --- |
| [Ruff](https://docs.astral.sh/ruff/) | Linting and formatting with 800+ rules |
| [mypy](https://mypy.readthedocs.io/) | Static type checking in strict mode |
| [Bandit](https://bandit.readthedocs.io/) | Security-focused static analysis |
| [uv-secure](https://github.com/owenlamont/uv-secure) | Dependency vulnerability scanning against PyPI advisories |

### Testing

| Tool | Description |
| --- | --- |
| [pytest](https://docs.pytest.org/) | Test framework with built-in doctest collection |
| [coverage](https://coverage.readthedocs.io/) | Code coverage enforcement at 80% |
| [pytest-xdist](https://pytest-xdist.readthedocs.io/) | Parallel test execution |

### Documentation

| Tool | Description |
| --- | --- |
| [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) | Documentation site with [mkdocstrings](https://mkdocstrings.github.io/) API reference |
| [Read the Docs](https://readthedocs.org/) | Automated documentation hosting |

### CI/CD

| Tool | Description |
| --- | --- |
| [GitHub Actions](https://docs.github.com/en/actions) | Lint, test matrix (Python 3.10–3.13 × Linux/macOS/Windows), docs build, and PyPI publish |
| [Codecov](https://codecov.io/) | Coverage reporting |
| [Dependabot](https://docs.github.com/en/code-security/dependabot) | Automated dependency updates |

### Developer Experience

| Tool | Description |
| --- | --- |
| [pre-commit](https://pre-commit.com/) | Git hooks on every commit |
| [Commitizen](https://commitizen-tools.github.io/commitizen/) | Conventional commits and changelog generation |
| [Makefile](Makefile) | Task runner for development commands |

## Usage

```bash
make check          # lint + type check + security scan + dependency audit
make test           # run tests with coverage
make all            # run everything
make format         # auto-fix and format code
make test-fast      # parallel tests, no coverage
make docs           # preview docs at localhost:8000
make build          # build sdist + wheel
make clean          # remove all artifacts
```

## Project Layout

```
.
├── src/hello_py/                   # Package source (src layout)
│   ├── __init__.py                 #   Public API and version
│   ├── hello.py                    #   Example module
│   └── py.typed                    #   PEP 561 type marker
├── tests/                          # Test suite
│   ├── __init__.py                 #   Package marker
│   ├── conftest.py                 #   Shared fixtures
│   ├── test_hello.py               #   Module tests
│   └── test_package.py             #   Package-level tests
├── docs/                           # Documentation source
│   ├── index.md                    #   Home page
│   ├── getting-started.md          #   Getting started guide
│   ├── changelog.md                #   Changelog
│   ├── contributing.md             #   Contributing guide
│   └── gen_ref_pages.py            #   API reference generator
├── .github/                        # GitHub configuration
│   ├── workflows/                  #   CI and Publish pipelines
│   ├── ISSUE_TEMPLATE/             #   Bug report and feature request forms
│   ├── pull_request_template.md    #   PR template
│   └── dependabot.yml              #   Dependency update config
├── pyproject.toml                  # Package metadata and tool config
├── Makefile                        # Development commands
├── mkdocs.yml                      # Documentation config
├── .pre-commit-config.yaml         # Git hook config
├── .readthedocs.yaml               # Read the Docs build config
├── .editorconfig                   # Editor formatting rules
├── .gitattributes                  # Git file handling rules
├── .gitignore                      # Git ignore patterns
├── codecov.yml                     # Coverage reporting config
├── CONTRIBUTING.md                 # Contributing guidelines
├── CHANGELOG.md                    # Release history
├── SECURITY.md                     # Security policy
├── LICENSE                         # MIT license
└── uv.lock                         # Locked dependencies
```

## Versioning

Versions are derived automatically from git tags via
[hatch-vcs](https://github.com/ofek/hatch-vcs). To release:

```bash
git tag v0.2.0
git push origin v0.2.0
```

Then create a
[GitHub Release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)
from the tag to trigger the PyPI publish workflow.

## Using This Template

1. Replace `hello-py`, `hello_py`, and `anaskalt` with your project and username.
2. Update `pyproject.toml` metadata — author, description, URLs, dependencies.
3. Run `make install` to set up the environment.
4. Replace `src/hello_py/` and `tests/` with your code.
5. Configure [PyPI trusted publishing](https://docs.pypi.org/trusted-publishers/).
6. Add your `CODECOV_TOKEN` to
   [repository secrets](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions).
7. Import your project on [Read the Docs](https://readthedocs.org/dashboard/import/).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the development workflow and guidelines.

## License

[MIT](LICENSE) — Anastasios Kaltakis
