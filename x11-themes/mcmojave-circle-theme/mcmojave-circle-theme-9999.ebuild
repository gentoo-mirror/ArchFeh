# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="McMojave-circle icon theme for linux desktops"
HOMEPAGE="https://github.com/vinceliuice/McMojave-circle"
SRC_URI="https://github.com/vinceliuice/McMojave-circle"
EGIT_REPO_URI="https://github.com/vinceliuice/McMojave-circle"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
insinto /usr/share/icons
doins -r src
}
