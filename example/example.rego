package example

p := {
    "blue": 1,
    "red": 0,
    "yellow": 2,
}

result = y {
    y := {x | p[x]} - {x | p[x] == 0}
}
