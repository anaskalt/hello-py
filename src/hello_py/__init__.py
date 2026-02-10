"""hello-py: A modern Python package template.

This package exists as a minimal example. Replace it with your own code.

Example:
    >>> from hello_py import greet
    >>> greet("World")
    'Hello, World!'
"""

from __future__ import annotations

from importlib.metadata import PackageNotFoundError
from importlib.metadata import version

from hello_py.hello import add
from hello_py.hello import greet

try:
    __version__ = version("hello-py")
except PackageNotFoundError:  # pragma: no cover
    __version__ = "0.0.0-dev"

__all__ = ["__version__", "add", "greet"]
