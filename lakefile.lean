import Lake
open Lake DSL

package «exercises» {
  -- add package configuration options here
}

lean_lib «Exercises» {
  -- add library configuration options here
}

@[default_target]
lean_exe «exercises» {
  root := `Main
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4/"
