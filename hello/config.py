"""Store configuration in one place, and allow overriding it with environment variables"""

import os

def try_env(key, default):
    """Gets the value of an environment variable, if it is set"""
    if key in os.environ:
        return os.environ[key]
    return default

message = try_env("MESSAGE", "I'm a giraffe!")
