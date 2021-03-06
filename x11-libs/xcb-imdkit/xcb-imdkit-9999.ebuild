# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils xdg-utils git-r3

DESCRIPTION="input method development support for xcb"
HOMEPAGE="https://github.com/fcitx/xcb-imdkit.git"
SRC_URI="https://github.com/fcitx/xcb-imdkit.git"
EGIT_REPO_URI="https://github.com/fcitx/xcb-imdkit.git"

LICENSE="BSD-1 GPL-2+ LGPL-2+ MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/xcb-util x11-libs/xcb-util-keysyms"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	cmake-utils_src_prepare
	xdg_environment_reset
}

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}/usr/$(get_libdir)"
	)
	cmake-utils_src_configure
}

src_install(){
	cmake-utils_src_install
}
