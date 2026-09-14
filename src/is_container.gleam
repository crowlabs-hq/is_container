import gleam/result
import gleam/string
import simplifile

/// Detects whether the current process is running inside a Docker container.
pub fn is_docker() -> Bool {
  file_exists("/.dockerenv")
  || file_contains("/proc/self/cgroup", "docker")
  || file_contains("/proc/self/mountinfo", "/docker/containers/")
}

/// Detects whether the current process is running inside a container.
///
/// This could be a Docker, LXC or Podman container.
pub fn is_container() -> Bool {
  is_docker()
  // Podman
  || file_exists("/run/.containerenv")
  // LXC
  || file_contains("/proc/1/environ", "container=lxc")
}

fn file_exists(fp: String) -> Bool {
  simplifile.exists(filepath: fp, follow_links: False)
  |> result.unwrap(False)
}

fn file_contains(fp: String, substring: String) -> Bool {
  simplifile.read(fp)
  |> result.map(string.contains(_, substring))
  |> result.unwrap(False)
}
