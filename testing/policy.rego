package testing

admins := ["alice", "bob"]

allow_action {
    input.user == admins[_]
    input.request.target == "db"
    input.request.action == "read"
}
