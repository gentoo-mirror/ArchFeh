# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils gnome2-utils xdg-utils git-r3

DESCRIPTION="Addons related to Chinese, including IME previous bundled inside fcitx4."
HOMEPAGE="https://github.com/fcitx/fcitx5-chinese-addons"
EGIT_REPO_URI="https://github.com/fcitx/fcitx5-chinese-addons.git"

LICENSE="BSD-1 GPL-2+ LGPL-2+ MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+opencc +gui test"

DEPEND="app-i18n/fcitx5
	app-i18n/libime
	app-i18n/fcitx5-qt[qt5]
	dev-qt/qtwebengine[widgets]
	opencc? ( app-i18n/opencc:= )
	gui? ( dev-qt/qtwebengine:5 )
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	cmake-utils_src_prepare
	xdg_environment_reset
}

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}/usr/$(get_libdir)"
		-DSYSCONFDIR="${EPREFIX}/etc"
		-DENABLE_GUI=$(usex gui)
		-DENABLE_OPENCC=$(usex opencc)
	)
	cmake-utils_src_configure
}

src_install(){
	cmake-utils_src_install
}
