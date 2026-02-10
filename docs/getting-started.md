# Getting Started

## Prerequisites

* Python 3.10 or later
* [uv](https://docs.astral.sh/uv/) — fast Python package manager
* [Git](https://git-scm.com/)
* [Make](https://www.gnu.org/software/make/) (optional but recommended)

## Installation

### As a Dependency

```bash
pip install hello-py
```

### For Development

```bash
git clone https://github.com/anaskalt/hello-py.git
cd hello-py

# Using Make (recommended)
make install

# Or manually
uv sync
uv run pre-commit install --install-hooks
uv run pre-commit install --hook-type commit-msg
```

## Make Targets

```bash
make check          # lint + type check + security scan
make test           # run tests with coverage
make all            # check + test

make format         # auto-fix lint issues and format code
make test-fast      # parallel execution, no coverage
make docs           # local preview at http://127.0.0.1:8000
make lock           # update lockfile after changing dependencies
make build          # build sdist + wheel
make clean          # remove all build artifacts
```

Run `make help` to see all available targets.

## Running Tools Directly

```bash
uv run ruff check src/ tests/            # lint
uv run ruff format src/ tests/           # format
uv run mypy src/                         # type check
uv run bandit -c pyproject.toml -r src/  # security scan
uv run pytest --cov --cov-report=html    # tests with HTML report
uv run pytest -n auto                    # parallel execution
uv run pre-commit run --all-files        # all hooks at once
```

## Documentation

```bash
uv run mkdocs serve    # local preview at http://127.0.0.1:8000
uv run mkdocs build    # build static site
```

## Dependencies

```bash
uv add requests               # add a runtime dependency
uv add --group test httpx     # add to the test group
uv add --group dev ipdb       # add to the dev group
uv lock                       # update lockfile
uv sync                       # sync environment with lockfile
```

## Build and Publish

```bash
uv build      # build sdist and wheel
uv publish    # upload to PyPI
```
