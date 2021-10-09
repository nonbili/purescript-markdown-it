{ name = "markdown-it"
, dependencies =
  [ "effect"
  , "prelude"
  , "psci-support"
  , "foldable-traversable"
  , "foreign"
  , "tuples"
  , "jest"
  , "node-process"
  , "options"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
