load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//tools/rules:workspace.bzl", "new_patched_local_repository")

def load_torch_repositories(local_path):
    http_archive(
        name = "bazel_skylib",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        ],
        sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
    )

    http_archive(
        name = "com_google_googletest",
        strip_prefix = "googletest-cd6b9ae3243985d4dc725abd513a874ab4161f3e",
        urls = [
            "https://github.com/google/googletest/archive/cd6b9ae3243985d4dc725abd513a874ab4161f3e.tar.gz",
        ],
    )

    http_archive(
      name = "pybind11_bazel",
      strip_prefix = "pybind11_bazel-7f397b5d2cc2434bbd651e096548f7b40c128044",
      urls = ["https://github.com/pybind/pybind11_bazel/archive/7f397b5d2cc2434bbd651e096548f7b40c128044.zip"],
      sha256 = "e4a9536f49d4a88e3c5a09954de49c4a18d6b1632c457a62d6ec4878c27f1b5b",
    )

    native.new_local_repository(
        name = "pybind11",
        build_file = "@pybind11_bazel//:pybind11.BUILD",
        path = local_path + "third_party/pybind11",
    )

    http_archive(
        name = "com_github_glog",
        strip_prefix = "glog-0.4.0",
        urls = [
            "https://github.com/google/glog/archive/v0.4.0.tar.gz",
        ],
    )

    http_archive(
        name = "com_github_gflags_gflags",
        strip_prefix = "gflags-2.2.2",
        urls = [
            "https://github.com/gflags/gflags/archive/v2.2.2.tar.gz",
        ],
        sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
    )

    native.new_local_repository(
        name = "gloo",
        build_file = "@pytorch//third_party:gloo.BUILD",
        path = local_path + "third_party/gloo",
    )

    native.new_local_repository(
        name = "onnx",
        build_file = "@pytorch//third_party:onnx.BUILD",
        path = local_path + "third_party/onnx",
    )

    native.new_local_repository(
        name = "foxi",
        build_file = "@pytorch//third_party:foxi.BUILD",
        path = local_path + "third_party/foxi",
    )

    native.local_repository(
        name = "com_google_protobuf",
        path = local_path + "third_party/protobuf",
    )

    native.new_local_repository(
        name = "eigen",
        build_file = "@pytorch//third_party:eigen.BUILD",
        path = local_path + "third_party/eigen",
    )

    native.new_local_repository(
        name = "fbgemm",
        build_file = "@pytorch//third_party:fbgemm/BUILD.bazel",
        path = local_path + "third_party/fbgemm",
    )

    native.new_local_repository(
        name = "ideep",
        build_file = "@pytorch//third_party:ideep.BUILD",
        path = local_path + "third_party/ideep",
    )

    native.new_local_repository(
        name = "mkl_dnn",
        build_file = "@pytorch//third_party:mkl-dnn.BUILD",
        path = local_path + "third_party/ideep/mkl-dnn",
    )

    native.new_local_repository(
        name = "cpuinfo",
        build_file = "@pytorch//third_party:cpuinfo.BUILD",
        path = local_path + "third_party/cpuinfo",
    )

    native.new_local_repository(
        name = "asmjit",
        build_file = "@pytorch//third_party:fbgemm/third_party/asmjit.BUILD",
        path = local_path + "third_party/fbgemm/third_party/asmjit",
    )

    native.new_local_repository(
        name = "sleef",
        build_file = "@pytorch//third_party:sleef.BUILD",
        path = local_path + "third_party/sleef",
    )

    native.new_local_repository(
        name = "fmt",
        build_file = "@pytorch//third_party:fmt.BUILD",
        path = local_path + "third_party/fmt",
    )

    new_patched_local_repository(
        name = "tbb",
        patches = [
            "@pytorch//third_party:tbb.patch",
        ],
        patch_strip = 1,
        build_file = "@pytorch//third_party:tbb.BUILD",
        path = local_path + "third_party/tbb",
    )

    native.new_local_repository(
        name = "tensorpipe",
        build_file = "@pytorch//third_party:tensorpipe.BUILD",
        path = local_path + "third_party/tensorpipe",
    )

    http_archive(
        name = "mkl",
        build_file = "@pytorch//third_party:mkl.BUILD",
        strip_prefix = "lib",
        sha256 = "59154b30dd74561e90d547f9a3af26c75b6f4546210888f09c9d4db8f4bf9d4c",
        urls = [
            "https://anaconda.org/anaconda/mkl/2020.0/download/linux-64/mkl-2020.0-166.tar.bz2",
        ],
    )

    http_archive(
        name = "mkl_headers",
        build_file = "@pytorch//third_party:mkl_headers.BUILD",
        sha256 = "2af3494a4bebe5ddccfdc43bacc80fcd78d14c1954b81d2c8e3d73b55527af90",
        urls = [
            "https://anaconda.org/anaconda/mkl-include/2020.0/download/linux-64/mkl-include-2020.0-166.tar.bz2",
        ],
    )

    http_archive(
        name = "rules_python",
        url = "https://github.com/bazelbuild/rules_python/releases/download/0.0.1/rules_python-0.0.1.tar.gz",
        sha256 = "aa96a691d3a8177f3215b14b0edc9641787abaaa30363a080165d06ab65e1161",
    )


