package system.authz

default allow = false

allow {
    allowed_method
    allowed_path
}

# Check method
allowed_method {
    input.method == "GET"
}
allowed_method {
    input.method == "POST"
}

# Check path
allowed_path {
    print(input.path)
    input.path[0] == "v1"
    input.path[1] == "data"
}
