def _terraform_fmt(ctx):
  out_file = ctx.actions.declare_file(ctx.attr.out)
  args = ctx.actions.args()
  command = ctx.toolchains["//bazel/toolchains/terraform_tools:toolchain_type"].command

  args.add("fmt")
  args.add("--check")
  args.add_all(ctx.files.files)

  ctx.actions.run(
      executable=command,
      arguments=[args],
      inputs= ctx.files.files,
      outputs=[out_file])
  return [DefaultInfo(files=depset([ctx.files.files]))]

terraform_fmt = rule(
  implementation = _terraform_fmt,
  attrs = {
    "files": attr.label_list(allow_files=True),
  }
)
