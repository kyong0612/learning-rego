package testing

test_modify_input {
    success_case := {
        "user": "alice",
        "request": {
            "target": "db",
            "action": "read",
        },
    }

    fail_case := object.union(success_case, {"request": {"action": "write"}})

    allow_action with input as success_case
    not allow_action with input as fail_case
}
