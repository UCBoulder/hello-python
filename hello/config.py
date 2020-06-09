import os

def try_env(key, default):
    if key in os.environ:
        print("Getting {} from env: {}".format(key, os.environ[key]))
        return os.environ[key]
    else:
        print("Giving default {}".format(default))
        return default

message = try_env("MESSAGE", "I'm a giraffe!")
