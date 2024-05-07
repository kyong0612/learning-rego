package main

import (
	"context"
	"fmt"

	"github.com/open-policy-agent/opa/rego"
)

func main() {
	input := struct {
		User string `json:"user"`
	}{
		User: "kyong0612",
	}

	module := `package blue

	allow {
		input.user == "kyong0612"
	}
	`

	q := rego.New(
		rego.Query(`x := data.blue.allow`),
		rego.Module("module.rego", module),
		rego.Input(input),
	)

	rs, err := q.Eval(context.Background())
	if err != nil {
		panic(err)
	}

	fmt.Println("allow =>", rs[0].Bindings["x"])
}
