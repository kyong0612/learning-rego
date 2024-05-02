package system.authz

test_authz {
	not _test_authz
}

_test_authz {
	tests := [
		{
			"title": "GET method is allowed",
			"input": {
				"path": ["v1", "data", "foo"],
				"method": "GET",
			},
			"exp": true,
		},
		{
			"title": "POST method is allowed",
			"input": {
				"path": ["v1", "data", "foo"],
				"method": "POST",
			},
			"exp": true,
		},
		{
			"title": "DELETE method is not allowed",
			"input": {
				"path": ["v1", "data", "foo"],
				"method": "DELETE",
			},
			"exp": false,
		},
		{
			"title": "other than /v1/data is not allowed",
			"input": {
				"path": ["v1", "policy"],
				"method": "GET",
			},
			"exp": false,
		},
	]

	t := tests[_]
	result := allow with input as t.input
	t.exp != result
	failed := sprintf("failed test '%s'. expected %v, but got %v", [t.title, t.exp, result])
	print(failed)
}
