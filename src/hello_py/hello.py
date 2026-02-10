"""Example module demonstrating the package template conventions.

This module exists purely as a placeholder. Replace it with your actual
package code. It showcases Google-style docstrings that MkDocs will
auto-generate into documentation.
"""

from __future__ import annotations

__all__ = ["add", "greet"]


def greet(name: str, *, greeting: str = "Hello") -> str:
    """Return a greeting string.

    Args:
        name: The name to greet.
        greeting: The greeting word. Defaults to ``"Hello"``.

    Returns:
        The formatted greeting.

    Raises:
        ValueError: If *name* is empty.

    Examples:
        >>> greet("World")
        'Hello, World!'
        >>> greet("Python", greeting="Hi")
        'Hi, Python!'
    """
    if not name.strip():
        msg = "name must not be empty"
        raise ValueError(msg)
    return f"{greeting}, {name}!"


def add(a: float, b: float) -> float:
    """Add two numbers.

    Args:
        a: First operand.
        b: Second operand.

    Returns:
        The sum of *a* and *b*.

    Examples:
        >>> add(2, 3)
        5
        >>> add(1.5, 2.5)
        4.0
    """
    return a + b
