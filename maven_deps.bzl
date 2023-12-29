load("@rules_java//toolchains:remote_java_repository.bzl", "remote_java_repository")

def __setup_jdk_dependencies(mctx):
    remote_java_repository(
        name = "roboriojdk_linux",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:linux",
        ],
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.4.1%2B1/OpenJDK17U-jdk_x64_linux_hotspot_17.0.4.1_1.tar.gz"],
        sha256 = "5fbf8b62c44f10be2efab97c5f5dbf15b74fae31e451ec10abbc74e54a04ff44",
        strip_prefix = "jdk-17.0.4.1+1",
    )

    remote_java_repository(
        name = "roboriojdk_mac",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:macos",
        ],
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.4.1%2B1/OpenJDK17U-jdk_x64_mac_hotspot_17.0.4.1_1.tar.gz"],
        sha256 = "ac21a5a87f7cfa00212ab7c41f7eb80ca33640d83b63ad850be811c24095d61a",
        strip_prefix = "jdk-17.0.4.1+1/Contents/Home",
    )

    remote_java_repository(
        name = "roboriojdk_win",
        prefix = "roboriojdk",
        version = "17",
        target_compatible_with = [
            "@platforms//os:windows",
        ],
        urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.4.1%2B1/OpenJDK17U-jdk_x64_windows_hotspot_17.0.4.1_1.zip"],
        sha256 = "3860d2ed7405674baeb0f9f4c71377421716759fe4301e92bdd4dd43c0442dc3",
        strip_prefix = "jdk-17.0.4.1+1",
    )

def setup_legacy_setup_jdk_dependencies():
    __setup_jdk_dependencies(None)

    REMOTE_JDK_REPOS = ["roboriojdk_linux", "roboriojdk_mac", "roboriojdk_win"]
    [native.register_toolchains("@" + name + "_toolchain_config_repo//:all") for name in REMOTE_JDK_REPOS]

deps = module_extension(
    __setup_jdk_dependencies,
)
