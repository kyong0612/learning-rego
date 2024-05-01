package debugging

servers := [
    {
        "name": "blue",
        "addr": "10.0.1.2",
        "port": [21, 22, 80]
    },
    {
        "name": "orange",
        "addr": "10.0.1.3",
        "port": [22, 5432]
    },
]

trace_example {
    server := servers[x]
    trace(sprintf("index:%d", [x]))

    is_ssh_port(server.port[_])
    is_orange(server.name)
}

is_ssh_port(p) {
    trace(sprintf("name=%s", [p]))
    p == 22
}

is_orange(n) {
    trace(sprintf("name=%s", [n]))
    n == "orange"
}
