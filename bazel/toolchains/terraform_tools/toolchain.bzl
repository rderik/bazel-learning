TerraformInfo = provider(
    doc = "Information about how to invoke Terraform.",
    fields = ["executable"],
)

def _terraform_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        terraform = TerraformInfo(
            executable = ctx.attr.executable,
        ),
    )
    return [toolchain_info]

terraform_toolchain = rule(
    implementation = _terraform_toolchain_impl,
    attrs = {
        "executable": attr.string(),
    },
)
