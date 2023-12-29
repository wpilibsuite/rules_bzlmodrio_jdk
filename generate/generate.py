from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.generate_shared_files import (
    write_shared_root_files,
    write_shared_test_files,
)
from bazelrio_gentool.utils import (
    TEMPLATE_BASE_DIR,
    write_file,
    render_template,
    render_templates,
)
from bazelrio_gentool.generate_module_project_files import (
    create_default_mandatory_settings,
)
from bazelrio_gentool.generate_shared_files import get_bazel_dependencies
from bazelrio_gentool.cli import add_generic_cli, GenericCliArgs
import argparse
import os


def main():
    SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")

    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    args = parser.parse_args()

    mandatory_dependencies = create_default_mandatory_settings(GenericCliArgs(args))

    write_shared_root_files(REPO_DIR, dict(repo_name="rules_bzlmodrio_jdk"))
    write_shared_test_files(REPO_DIR, dict())

    template_files = [
        # "templates/maven_deps.bzl",
        "WORKSPACE",
        "MODULE.bazel",
        "tests/WORKSPACE",
        "tests/MODULE.bazel",
    ]

    render_templates(
        template_files,
        REPO_DIR,
        os.path.join(SCRIPT_DIR, "templates"),
        # group=group,
        # repos=repos,
        # libraries=libraries,
        bazel_dependencies=get_bazel_dependencies(),
        mandatory_dependencies=mandatory_dependencies,
    )


if __name__ == "__main__":
    """
    bazel run //:generate
    """
    main()
