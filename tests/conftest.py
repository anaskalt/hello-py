"""Shared pytest fixtures.

Add package-wide fixtures here. They are automatically available
to all tests without importing.
"""

from __future__ import annotations

from pathlib import Path

import pytest


@pytest.fixture
def project_root() -> Path:
    """Return the project root directory."""
    return Path(__file__).resolve().parent.parent
