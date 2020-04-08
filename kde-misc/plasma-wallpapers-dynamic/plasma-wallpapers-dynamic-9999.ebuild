# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="plasma5-wallpapers-dynamic is a simple dynamic wallpaper plugin for KDE Plasma."
HOMEPAGE="https://github.com/zzag/plasma5-wallpapers-dynamic"
SRC_URI="https://github.com/zzag/plasma5-wallpapers-dynamic"
EGIT_REPO_URI="https://github.com/zzag/plasma5-wallpapers-dynamic"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-qt/qtlocation"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_postinst() {
	einfo "To actually use this addons, read at:"
	einfo "    ${HOMEPAGE}"
}

