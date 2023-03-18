load("//:bazel/archive.bzl", "archive")

archive(
  name="documentation",
  files=[
    "documentation/README.md",
  ],
  out="documentation.tgz",
)

archive(
  name="release",
  files=[
    "documentation/RELEASE.md",
  ],
  out="release.tgz",
)
archive(
  name="all",
  files=[
    "documentation/README.md",
    "documentation/RELEASE.md",
  ],
  out="all.tgz",
)
