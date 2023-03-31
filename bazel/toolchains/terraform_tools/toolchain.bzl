def _terraform_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        barcinfo = TerraformInfo(
            command = ctx.attr.command,
        ),
    )
    return [toolchain_info]

terraform_toolchain = rule(
    implementation = _terraform_toolchain_impl,
    attrs = {
        "command": attr.string(),
    },
)
