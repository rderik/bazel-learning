def _terraform_fmt(ctx):
  args = ctx.actions.args()
  executable = ctx.toolchains["//bazel/toolchains/terraform_tools:toolchain_type"].terraform.executable
  out_file = ctx.actions.declare_file("fmt.out")

  args.add("fmt")
  args.add("--check")
  args.add_all(ctx.files.files)

  file_paths = " ".join([file.path for file in ctx.files.files])
  full_command = "{} fmt --check {} > {}".format(executable, file_paths, out_file.path) 
  print("This is full command: {}".format(full_command))
  ctx.actions.run_shell(
      command=full_command,
      arguments=[args],
      inputs= ctx.files.files,
      outputs= [out_file],
      )
  return [DefaultInfo(files = depset([out_file]))]

terraform_fmt = rule(
  implementation = _terraform_fmt,
  attrs = {
    "files": attr.label_list(allow_files=True),
  },
  toolchains = ["//bazel/toolchains/terraform_tools:toolchain_type"],
)
