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
        sha256 = "9d4dd339bf7e6a9dcba8347661603b74c61ab2a5083ae67bf76da6285da8a778",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.12%2B7/OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7.tar.gz"],
        strip_prefix = "jdk-17.0.12+7",
    )

    remote_java_repository(
        name = "roboriojdk_linux_arm64",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:arm64",
        ],
        sha256 = "8257de06bf37f0c8f19f8d542e2ab5a4e17db3ca5f29d041bd0b02ab265db021",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.12%2B7/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.12_7.tar.gz"],
        strip_prefix = "jdk-17.0.12+7",
    )

    remote_java_repository(
        name = "roboriojdk_mac",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:macos",
            "@platforms//cpu:x86_64",
        ],
        sha256 = "d5230eeec88739aa7133e4c8635bbd4ab226708c12deaafa13cf26b02bc8e8c4",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.12%2B7/OpenJDK17U-jdk_x64_mac_hotspot_17.0.12_7.tar.gz"],
        strip_prefix = "jdk-17.0.12+7/Contents/Home",
    )

    remote_java_repository(
        name = "roboriojdk_mac_arm64",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:macos",
            "@platforms//cpu:aarch64",
        ],
        sha256 = "d7910b1acaeb290c5c5da21811d2b2b8635f806612a2d6e8d1953b2f77580f78",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.12%2B7/OpenJDK17U-jdk_aarch64_mac_hotspot_17.0.12_7.tar.gz"],
        strip_prefix = "jdk-17.0.12+7/Contents/Home",
    )

    remote_java_repository(
        name = "roboriojdk_windows",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:windows",
            # Assume JDK works for any CPU,
        ],
        sha256 = "052049d687ebfda6a4032d54afcd0da6549a23bc2ed04cfaa509746eeacbae71",
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.12%2B7/OpenJDK17U-jdk_x64_windows_hotspot_17.0.12_7.zip"],
        strip_prefix = "jdk-17.0.12+7",
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
