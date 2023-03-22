load("//:bazel/archive.bzl", "archive")

archive(
    name = "documentation",
    out = "documentation.tgz",
    files = [
        "documentation/README.md",
    ],
)

archive(
    name = "release",
    out = "release.tgz",
    files = [
        "documentation/RELEASE.md",
    ],
)

archive(
    name = "all",
    out = "all.tgz",
    files = [
        "documentation/README.md",
        "documentation/RELEASE.md",
    ],
)
