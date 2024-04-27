run "default" {
  command = apply

  module {
    source = "./tests/fixtures/default"
  }
}
