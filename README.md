# is_container

[![Package Version](https://img.shields.io/hexpm/v/is_container)](https://hex.pm/packages/is_container)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://is-container.hexdocs.pm/)


This package allows you to know whether you're running inside a container.

```sh
gleam add is_container
```

```gleam
import gleam/io
import is_container.{is_docker, is_container}

pub fn main() -> Nil {
  case is_docker() {
    True -> io.println("Running inside Docker")
    False ->
      case is_container() {
        True -> io.println("Running inside a container (Podman/LXC)")
        False -> io.println("Not running inside a container")
      }
  }
}
```

Further documentation can be found at <https://is-container.hexdocs.pm/>.

## License

This project is licensed under the **Apache License 2.0**. See the [LICENSE](./LICENSE) file for details.