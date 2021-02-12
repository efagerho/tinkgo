"""
Initialization of dependencies of Go Tink.
"""

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

# How to update go dependencies:
# 1) Update the files go.mod and go.sum. This can be done as follows:
#    1.1) Replacing all versions in go.mod with "latest".
#    1.2) Run "go mod tidy".
# 2) Update this file by running within a google3 folder
#    cd third_party/tink/go
#    bazel run //:gazelle -- update-repos -from_file=go.mod -to_macro 'tink_go_deps_init.bzl%tink_go_deps_init'
#    g4 open go.mod go.sum tink_go_deps_init.bzl

def tink_go_deps_init():
    """ Initializes dependencies of Go Tink.

    """
    go_rules_dependencies()
    go_register_toolchains(nogo = "@//:tink_nogo")
    gazelle_dependencies()

