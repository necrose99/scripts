#!/usr/bin/env python
#generate with chatgpt
import os

# Define some variables for the ebuild
pkgname = "my_package"
pkgver = "1.0"
ebuild_path = "/usr/local/portage/dev-lang/my_package"
lua_versions = ["5.1", "5.2", "5.3"]
maintainer = "Your Name <you@example.com>"
homepage = "https://www.example.com"

# Create the ebuild directory if it doesn't exist
if not os.path.exists(ebuild_path):
    os.makedirs(ebuild_path)

# Create the ebuild file
with open(os.path.join(ebuild_path, f"{pkgname}-{pkgver}.ebuild"), "w") as f:
    # Write the basic ebuild information
    f.write("# Copyright 2023 Your Name\n")
    f.write("EAPI=7\n")
    f.write(f"Inherit lua\n\n")
    
    # Write the package information
    f.write(f"DESCRIPTION=\"My package description\"\n")
    f.write(f"HOMEPAGE=\"{homepage}\"\n")
    f.write(f"SRC_URI=\"https://www.example.com/{pkgname}-{pkgver}.tar.gz\"\n\n")
    
    # Write the Lua eclass information
    f.write("DEPEND=\"\n")
    for lua_version in lua_versions:
        f.write(f"   dev-lang/lua:{lua_version}\n")
    f.write("\"\n\n")
    
    # Write the maintainer information
    f.write(f"MAINTAINER=\"{maintainer}\"\n")
    f.write(f"KEYWORDS=\"~amd64\"\n")
    f.write(f"SLOT=\"0\"\n")
    f.write(f"LICENSE=\"MIT\"\n")
    f.write(f"IUSE=\"\"\n")
    f.write(f"S="${{WORKDIR}}/{pkgname}-${{PV}}"\n")
    
    # Write the install and test phases
    f.write("src_compile() {\n")
    f.write("   emake\n")
    f.write("}\n\n")
    f.write("src_install() {\n")
    f.write("   default\n")
    f.write("}\n\n")
    f.write("src_test() {\n")
    f.write("   emake test\n")
    f.write("}\n")

# Make the ebuild executable
os.chmod(os.path.join(ebuild_path, f"{pkgname}-{pkgver}.ebuild"), 0o755)

# Print a message indicating that the ebuild has been generated
print(f"Ebuild for {pkgname}-{pkgver} has been generated in {ebuild_path}")
