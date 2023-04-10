def _yamllint(ctx):
    args = ctx.actions.args()

    # Grab a reference to the root of the users project
    #workspace_dir = ctx.workspace_dir
    workspace_dir = "/home/vagrant/bazel-proj/"
    workspace_dir = ctx.expand_location("/")
    executable = ctx.toolchains["//bazel/toolchains/yamllint:toolchain_type"].yamllint.executable
    out_file = ctx.actions.declare_file("fmt.out")

    args.add("-f")
    args.add("parsable")
    args.add("-c")
    args.add("%s.yamllint.yaml" % workspace_dir)
    args.add_all(ctx.files.files)

    #args = [ "-f", "parsable", "-c", "/home/vagrant/bazel-proj/.yamllint.yaml"]
    args = ["-f", "parsable"]

    file_paths = " ".join([file.path for file in ctx.files.files])
    full_command = "({} {} {}) | tee {} && exit ${{PIPESTATUS[0]}}".format(executable, " ".join(args), file_paths, out_file.path)
    print("This is full command: {}".format(full_command))
    print(args)
    ctx.actions.run_shell(
        command = full_command,
        inputs = ctx.files.files,
        outputs = [out_file],
    )

    #ctx.actions.run(
    #executable=full_command,
    #inputs= ctx.files.files,
    #outputs= [out_file],
    #)
    return [DefaultInfo(files = depset([out_file]))]

yamllint = rule(
    implementation = _yamllint,
    attrs = {
        "files": attr.label_list(allow_files = True),
    },
    toolchains = ["//bazel/toolchains/yamllint:toolchain_type"],
)
