YamlLintInfo = provider(
    doc = "Information about how to invoke YamlLint.",
    fields = ["executable"],
)

def _yamllint_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        yamllint = YamlLintInfo(
            executable = ctx.attr.executable,
        ),
    )
    return [toolchain_info]

yamllint_toolchain = rule(
    implementation = _yamllint_toolchain_impl,
    attrs = {
        "executable": attr.string(),
    },
)
