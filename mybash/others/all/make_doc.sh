sphinx-apidoc -f -o ./docs/policy src/policy
sphinx-apidoc -f -o ./docs/contextual_policy src/contextual_policy
sphinx-apidoc -f -o ./docs src
sphinx-build -b singlehtml ./docs ./docs/_build
