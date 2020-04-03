# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

SRC_URI_BASE="https://launcher.mojang.com/download"

inherit desktop eutils xdg-utils

DESCRIPTION="Official launcher for Minecraft"
HOMEPAGE="https://www.minecraft.net/"

SRC_URI="
	${SRC_URI_BASE}/linux/x86_64/${PN}_${PV}.tar.gz -> ${P}.tar.gz
	${SRC_URI_BASE}/${PN}.svg -> ${P}.svg
"

LICENSE="Minecraft-clickwrap-EULA"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""
RESTRICT="bindist mirror strip"

DEPEND=""

# This list is based on Mojang's deb package.
RDEPEND="${DEPEND}
	gnome-base/gconf
	sys-apps/dbus
	x11-apps/xrandr
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/xcb-util
	>=x11-libs/gtk+-2.24.32-r1
	media-libs/openal
	virtual/opengl
	virtual/jre"

S="${WORKDIR}"
QA_PREBUILT="opt/${PN}"

src_install() {
	local -r dir="/opt/${PN}"

	dodir "${dir}"
	cp -ar "${PN}"/* "${D}/${dir}" || die
	newicon "${DISTDIR}/${P}.svg" "${PN}.svg"

	make_wrapper "${PN}" "${dir}/${PN}" "" "${dir}"
	make_desktop_entry "${PN}" "Minecraft launcher" "${PN}" \
		"Game;ActionGame;AdventureGame;Java"
}
pkg_postinst() {
	einfo "This package has installed the Minecraft launcher."
	einfo "To actually play the game, you need to purchase an account at:"
	einfo "    ${HOMEPAGE}"

	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
