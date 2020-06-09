import cowsay
from . import config

def hello():
    cowsay.stegosaurus(config.message)
