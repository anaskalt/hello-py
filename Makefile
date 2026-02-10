# =============================================================================
#  HELLO-PY
#  A modern, production-ready Python package template
# =============================================================================

SRC   := src/
TESTS := tests/
ALL   := $(SRC) $(TESTS)
RUN   := uv run

GREEN := \033[0;32m
WHITE := \033[1;37m
DIM   := \033[0;90m
RESET := \033[0m

.DEFAULT_GOAL := help

.PHONY: install lock lint format typecheck security audit check \
        test test-fast test-all \
        docs docs-build \
        build clean pre-commit all help

# ── Development ──────────────────────────────────────────────────────────────

install: ## Install dev environment and hooks
	@uv sync
	@$(RUN) pre-commit install --install-hooks
	@$(RUN) pre-commit install --hook-type commit-msg
	@echo "$(GREEN)✓ Ready$(RESET)"

lock: ## Update lockfile
	@uv lock

# ── Code Quality ─────────────────────────────────────────────────────────────

lint: ## Lint and check formatting
	@$(RUN) ruff check $(ALL)
	@$(RUN) ruff format --check $(ALL)

format: ## Auto-fix and format
	@$(RUN) ruff check --fix $(ALL)
	@$(RUN) ruff format $(ALL)

typecheck: ## Type check (mypy strict)
	@$(RUN) mypy $(SRC)

security: ## Security scan (bandit)
	@$(RUN) bandit -c pyproject.toml -r $(SRC)

audit: ## Dependency vulnerability scan (uv-secure)
	@$(RUN) uv-secure

check: lint typecheck security audit ## All static analysis

# ── Testing ──────────────────────────────────────────────────────────────────

test: ## Tests with coverage
	@$(RUN) pytest --cov --cov-report=term-missing

test-fast: ## Parallel tests (no coverage)
	@$(RUN) pytest -n auto -q

test-all: ## Full suite + HTML report
	@$(RUN) pytest --cov --cov-report=html -v
	@echo "$(DIM)→ htmlcov/index.html$(RESET)"

# ── Documentation ────────────────────────────────────────────────────────────

docs: ## Serve docs locally
	@$(RUN) mkdocs serve

docs-build: ## Build docs (strict)
	@$(RUN) mkdocs build --strict

# ── Build & Clean ────────────────────────────────────────────────────────────

build: ## Build sdist + wheel
	@uv build

clean: ## Remove artifacts and caches
	@rm -rf dist/ build/ site/ .eggs/
	@rm -rf .pytest_cache/ .mypy_cache/ .ruff_cache/
	@rm -rf htmlcov/ .coverage coverage.xml
	@find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	@echo "$(GREEN)✓ Clean$(RESET)"

# ── Shortcuts ────────────────────────────────────────────────────────────────

pre-commit: ## Run all pre-commit hooks
	@$(RUN) pre-commit run --all-files

all: check test ## All checks + tests
	@echo "$(GREEN)✓ All passed$(RESET)"

# ── Help ─────────────────────────────────────────────────────────────────────

help:
	@echo ""
	@echo "  $(GREEN)┌─────────────────────────────────────────────┐$(RESET)"
	@echo "  $(GREEN)│$(RESET)                  $(WHITE)HELLO-PY$(RESET)                   $(GREEN)│$(RESET)"
	@echo "  $(GREEN)│$(RESET)       $(DIM)Modern Python package template$(RESET)        $(GREEN)│$(RESET)"
	@echo "  $(GREEN)└─────────────────────────────────────────────┘$(RESET)"
	@echo ""
	@echo "  $(DIM)usage:$(RESET) make [target]"
	@echo ""
	@echo "  $(WHITE)Development$(RESET)"
	@echo "    $(GREEN)install$(RESET)      $(DIM)Install dev environment and hooks$(RESET)"
	@echo "    $(GREEN)lock$(RESET)         $(DIM)Update lockfile$(RESET)"
	@echo ""
	@echo "  $(WHITE)Code Quality$(RESET)"
	@echo "    $(GREEN)lint$(RESET)         $(DIM)Lint and check formatting$(RESET)"
	@echo "    $(GREEN)format$(RESET)       $(DIM)Auto-fix and format$(RESET)"
	@echo "    $(GREEN)typecheck$(RESET)    $(DIM)Type check (mypy strict)$(RESET)"
	@echo "    $(GREEN)security$(RESET)     $(DIM)Security scan (bandit)$(RESET)"
	@echo "    $(GREEN)audit$(RESET)        $(DIM)Dependency vulnerability scan (uv-secure)$(RESET)"
	@echo "    $(GREEN)check$(RESET)        $(DIM)All static analysis$(RESET)"
	@echo ""
	@echo "  $(WHITE)Testing$(RESET)"
	@echo "    $(GREEN)test$(RESET)         $(DIM)Tests with coverage$(RESET)"
	@echo "    $(GREEN)test-fast$(RESET)    $(DIM)Parallel tests (no coverage)$(RESET)"
	@echo "    $(GREEN)test-all$(RESET)     $(DIM)Full suite + HTML report$(RESET)"
	@echo ""
	@echo "  $(WHITE)Documentation$(RESET)"
	@echo "    $(GREEN)docs$(RESET)         $(DIM)Serve docs locally$(RESET)"
	@echo "    $(GREEN)docs-build$(RESET)   $(DIM)Build docs (strict)$(RESET)"
	@echo ""
	@echo "  $(WHITE)Build & Clean$(RESET)"
	@echo "    $(GREEN)build$(RESET)        $(DIM)Build sdist + wheel$(RESET)"
	@echo "    $(GREEN)clean$(RESET)        $(DIM)Remove artifacts and caches$(RESET)"
	@echo ""
	@echo "  $(WHITE)Shortcuts$(RESET)"
	@echo "    $(GREEN)pre-commit$(RESET)   $(DIM)Run all pre-commit hooks$(RESET)"
	@echo "    $(GREEN)all$(RESET)          $(DIM)All checks + tests$(RESET)"
	@echo ""
	@echo ""
	@echo "  $(DIM)Author: Anastasios Kaltakis$(RESET)"
	@echo ""
