"""Functions that say hello"""

import cowsay
from . import config

def hello():
    """Print a pretty stegosaurus that has something to say."""
    cowsay.stegosaurus(config.message)
