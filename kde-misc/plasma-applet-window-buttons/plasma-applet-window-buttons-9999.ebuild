# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
KFMIN=5.64.0
QTMIN=5.12.3
inherit ecm git-r3

DESCRIPTION="This is a Plasma 5 applet that shows window buttons in your panels."
HOMEPAGE="https://github.com/psifidotos/applet-window-buttons"
SRC_URI="https://github.com/psifidotos/applet-window-buttons"
EGIT_REPO_URI="https://github.com/psifidotos/applet-window-buttons"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
