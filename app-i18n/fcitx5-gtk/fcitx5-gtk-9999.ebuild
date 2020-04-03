# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3 gnome2-utils xdg-utils

DESCRIPTION="Gtk im module for fcitx5 and glib based dbus client library"
HOMEPAGE="https://github.com/fcitx/fcitx5-gtk"
EGIT_REPO_URI="https://github.com/fcitx/fcitx5-gtk.git"

LICENSE="BSD-1 GPL-2+ LGPL-2+ MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+gtk2 +gtk3 +introspection +snooper"

DEPEND="app-i18n/fcitx5
	gtk2? ( x11-libs/gtk+:2 )
	gtk3? ( x11-libs/gtk+:3 )
	introspection? ( dev-libs/gobject-introspection )
	kde-frameworks/extra-cmake-modules
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}/usr/$(get_libdir)"
		-DSYSCONFDIR="${EPREFIX}/etc"
		-DCMAKE_INSTALL_LIBDIR="${EPREFIX}/usr/$(get_libdir)"
		-DCMAKE_BUILD_TYPE=Release
		-DENABLE_GTK2_IM_MODULE=$(usex gtk2)
		-DENABLE_GTK3_IM_MODULE=$(usex gtk3)
		-DENABLE_SNOOPER=$(usex snooper)
		-DENABLE_GIR=$(usex introspection)
	)
	cmake-utils_src_configure
}

src_install(){
	cmake-utils_src_install
}
pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	use gtk2 && gnome2_query_immodules_gtk2
	use gtk3 && gnome2_query_immodules_gtk3
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	use gtk2 && gnome2_query_immodules_gtk2
	use gtk3 && gnome2_query_immodules_gtk3
}
