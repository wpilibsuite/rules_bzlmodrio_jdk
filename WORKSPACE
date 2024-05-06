workspace(name = "rules_bzlmodrio_jdk")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_java",
    sha256 = "4da3761f6855ad916568e2bfe86213ba6d2637f56b8360538a7fb6125abf6518",
    url = "https://github.com/bazelbuild/rules_java/releases/download/7.5.0/rules_java-7.5.0.tar.gz",
)

load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")

rules_java_dependencies()

rules_java_toolchains()

load("@rules_bzlmodrio_jdk//:maven_deps.bzl", "setup_legacy_setup_jdk_dependencies")

setup_legacy_setup_jdk_dependencies()
