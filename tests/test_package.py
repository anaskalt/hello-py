"""Tests for the hello_py package interface."""

from __future__ import annotations

import hello_py


class TestPackage:
    """Tests for package-level attributes and imports."""

    def test_version_is_string(self):
        assert isinstance(hello_py.__version__, str)

    def test_version_is_not_empty(self):
        assert hello_py.__version__

    def test_public_api(self):
        expected = {"__version__", "add", "greet"}
        assert set(hello_py.__all__) == expected

    def test_greet_accessible_from_package(self):
        result = hello_py.greet("World")
        assert result == "Hello, World!"

    def test_add_accessible_from_package(self):
        result = hello_py.add(1, 2)
        assert result == 3
