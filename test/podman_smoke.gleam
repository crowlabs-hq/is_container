import is_container.{is_container, is_docker}

// This must not run outside a container
// (which is also why it hasn't been named "*_test.gleam")
pub fn main() -> Nil {
  assert False == is_docker()
  assert True == is_container()
}
