load("@rules_java//toolchains:remote_java_repository.bzl", "remote_java_repository")

def __setup_jdk_dependencies(mctx):
    remote_java_repository(
        name = "roboriojdk_linux",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:x86_64",
        ],
        sha256 = "c25dfbc334068a48c19c44ce39ad4b8427e309ae1cfa83f23c102e78b8a6dcc0",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%2B1/OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz"],
        strip_prefix = "jdk-17.0.8.1+1",
    )

    remote_java_repository(
        name = "roboriojdk_linux_arm64",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:armv7",
        ],
        sha256 = "eefd3cf3b3dd47ff269fa5b5c10b5e096b163f4e9c1810023abdbc00dc6cc304",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%2B1/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8.1_1.tar.gz"],
        strip_prefix = "jdk-17.0.8.1+1",
    )

    remote_java_repository(
        name = "roboriojdk_mac",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:macos",
            "@platforms//cpu:x86_64",
        ],
        sha256 = "18be56732c1692ef131625d814dcb02ee091a43fdd6f214a33d87cc14842fc3f",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%2B1/OpenJDK17U-jdk_x64_mac_hotspot_17.0.8.1_1.tar.gz"],
        strip_prefix = "jdk-17.0.8.1+1/Contents/Home",
    )

    remote_java_repository(
        name = "roboriojdk_mac_arm64",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:macos",
            "@platforms//cpu:aarch64",
        ],
        sha256 = "2e95eed48650f00650e963c8213b6c6ecda54458edf8d254ebc99d6a6966ffad",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%2B1/OpenJDK17U-jdk_aarch64_mac_hotspot_17.0.8.1_1.tar.gz"],
        strip_prefix = "jdk-17.0.8.1+1/Contents/Home",
    )

    remote_java_repository(
        name = "roboriojdk_windows",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:windows",
            # Assume JDK works for any CPU,
        ],
        sha256 = "651a795155dc918c06cc9fd4b37253b9cbbca5ec8e76d4a8fa7cdaeb1f52761c",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%2B1/OpenJDK17U-jdk_x64_windows_hotspot_17.0.8.1_1.zip"],
        strip_prefix = "jdk-17.0.8.1+1",
    )

def setup_legacy_setup_jdk_dependencies():
    __setup_jdk_dependencies(None)

    REMOTE_JDK_REPOS = [
        "roboriojdk_linux",
        "roboriojdk_linux_arm64",
        "roboriojdk_mac",
        "roboriojdk_mac_arm64",
        "roboriojdk_windows",
    ]
    [native.register_toolchains("@" + name + "_toolchain_config_repo//:all") for name in REMOTE_JDK_REPOS]

deps = module_extension(
    __setup_jdk_dependencies,
)
