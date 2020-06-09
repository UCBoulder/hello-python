# hello-python
Template for packaging python scripts in a container

### Developing

1. Copy these contents to a new repo.
2. Replace the `hello` directory with a new python package that implements your desired functionality.
3. Update the tests directory to exercise important functionality in your python package.
4. Update entrypoint.py to call your new python package.

### Suggested practices

1. Don't skip the "writing tests" step
2. Allow configurable parameters to be set with environment variables

### Building
This will also run the tests.

    podman build -t hello-python .
    
or

    docker build -t hello-python .
    
### Running

    podman run hello-python:latest
    
or

    docker run hello-python:latest
    
