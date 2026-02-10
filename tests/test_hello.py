"""Tests for hello_py.hello module."""

from __future__ import annotations

import pytest

from hello_py import add
from hello_py import greet


class TestGreet:
    """Tests for the greet function."""

    def test_default_greeting(self):
        assert greet("World") == "Hello, World!"

    def test_custom_greeting(self):
        assert greet("Python", greeting="Hi") == "Hi, Python!"

    def test_empty_name_raises(self):
        with pytest.raises(ValueError, match="name must not be empty"):
            greet("")

    def test_whitespace_name_raises(self):
        with pytest.raises(ValueError, match="name must not be empty"):
            greet("   ")

    @pytest.mark.parametrize(
        ("name", "expected"),
        [
            ("Alice", "Hello, Alice!"),
            ("Bob", "Hello, Bob!"),
            ("Ελληνικά", "Hello, Ελληνικά!"),
        ],
    )
    def test_various_names(self, name: str, expected: str):
        assert greet(name) == expected


class TestAdd:
    """Tests for the add function."""

    def test_integers(self):
        assert add(2, 3) == 5

    def test_floats(self):
        assert add(1.5, 2.5) == pytest.approx(4.0)

    def test_negative(self):
        assert add(-1, 1) == 0

    @pytest.mark.parametrize(
        ("a", "b", "expected"),
        [
            (0, 0, 0),
            (100, -100, 0),
            (0.1, 0.2, 0.3),
        ],
    )
    def test_parametrized(self, a: float, b: float, expected: float):
        assert add(a, b) == pytest.approx(expected)
