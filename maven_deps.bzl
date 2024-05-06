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
        sha256 = "aa5fc7d388fe544e5d85902e68399d5299e931f9b280d358a3cbee218d6017b0",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8%2B7/OpenJDK17U-jdk_x64_linux_hotspot_17.0.8_7.tar.gz"],
        strip_prefix = "jdk-17.0.8+7",
    )

    remote_java_repository(
        name = "roboriojdk_linux",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:aarch64",
        ],
        sha256 = "c43688163cfdcb1a6e6fe202cc06a51891df746b954c55dbd01430e7d7326d00",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8%2B7/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8_7.tar.gz"],
        strip_prefix = "jdk-17.0.8+7",
    )

    remote_java_repository(
        name = "roboriojdk_mac",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:macos",
            "@platforms//cpu:x86_64",
        ],
        sha256 = "6fea89cea64a0f56ecb9e5d746b4921d2b0a80aa65c92b265ee9db52b44f4d93",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8%2B7/OpenJDK17U-jdk_x64_mac_hotspot_17.0.8_7.tar.gz"],
        strip_prefix = "jdk-17.0.8+7/Contents/Home",
    )

    remote_java_repository(
        name = "roboriojdk_mac",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:macos",
            "@platforms//cpu:aarch64",
        ],
        sha256 = "105d1ada42927fccde215e8c80b43221cd5aad42e6183819c367234ac062fc10",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8%2B7/OpenJDK17U-jdk_aarch64_mac_hotspot_17.0.8_7.tar.gz"],
        strip_prefix = "jdk-17.0.8+7/Contents/Home",
    )

    remote_java_repository(
        name = "roboriojdk_windows",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:windows",
            # Assuming JDK works for both arm and x86
        ],
        sha256 = "341a7243778802019a100ba7ae32a05a3f4ae5fd64dbf2a970d02f07c7d1c804",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8%2B7/OpenJDK17U-jdk_x64_windows_hotspot_17.0.8_7.zip"],
        strip_prefix = "jdk-17.0.8+7",
    )

def setup_legacy_setup_jdk_dependencies():
    __setup_jdk_dependencies(None)

    REMOTE_JDK_REPOS = ["roboriojdk_linux", "roboriojdk_mac", "roboriojdk_windows"]
    [native.register_toolchains("@" + name + "_toolchain_config_repo//:all") for name in REMOTE_JDK_REPOS]

deps = module_extension(
    __setup_jdk_dependencies,
)
