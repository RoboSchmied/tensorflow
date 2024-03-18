licenses(["restricted"])  # NVIDIA proprietary license

filegroup(
    name = "include",
    srcs = glob([
        "include/**",
    ]),
)

filegroup(
    name="nvjitlink_lib",
    srcs = ["lib/libnvJitLink.so.%{version}"]
)

cc_import(
    name = "nvjitlink",
    hdrs = [":headers"],
    shared_library = "lib/libnvJitLink.so.%{version}",
    visibility = ["//visibility:public"],
)

cc_library(
    name = "headers",
    hdrs = [":include"],
    include_prefix = "third_party/gpus/cuda/include",
    includes = ["include"],
    strip_include_prefix = "include",
    visibility = ["@local_config_cuda//cuda:__pkg__"],
)
