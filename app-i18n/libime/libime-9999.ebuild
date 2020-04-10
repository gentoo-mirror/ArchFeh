# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
CMAKE_IN_SOURCE_BUILD=true
CMAKE_MAKEFILE_GENERATOR=emake

inherit cmake-utils gnome2-utils xdg-utils git-r3

DESCRIPTION="Fcitx5 Next generation of fcitx"
HOMEPAGE="https://fcitx-im.org/ https://gitlab.com/fcitx/libime"
EGIT_REPO_URI="https://github.com/fcitx/libime.git"

LICENSE="BSD-1 GPL-2+ LGPL-2+ MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-i18n/fcitx5
		dev-libs/boost
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig
		kde-frameworks/extra-cmake-modules:5
"

src_prepare() {
	git submodule update --init
	cmake-utils_src_prepare
	xdg_environment_reset
}

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}/usr/$(get_libdir)"
		-DSYSCONFDIR="${EPREFIX}/etc"
	)
	cmake-utils_src_configure
}

src_install(){
	cmake-utils_src_install
}
