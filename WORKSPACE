workspace(name = "rules_bzlmodrio_jdk")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_java",
    sha256 = "a37a4e5f63ab82716e5dd6aeef988ed8461c7a00b8e936272262899f587cd4e1",
    url = "https://github.com/bazelbuild/rules_java/releases/download/7.1.0/rules_java-7.1.0.tar.gz",
)

load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")

rules_java_dependencies()

rules_java_toolchains()

load("@rules_bzlmodrio_jdk//:maven_deps.bzl", "setup_legacy_setup_jdk_dependencies")

setup_legacy_setup_jdk_dependencies()
