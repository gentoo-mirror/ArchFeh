# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils xdg-utils desktop

DESCRIPTION="Manage all your JetBrains Projects and Tools"
HOMEPAGE="https://www.jetbrains.com/toolbox/app"
SRC_URI="https://download.jetbrains.com/toolbox/${P}.tar.gz"

LICENSE="JetBrainsToolbox"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-fs/fuse:*"
RDEPEND="${DEPEND}"
BDEPEND=""
QA_PRESTRIPPED="/opt/jetbrains-toolbox/jetbrains-toolbox"
src_compile() {
        ./"${PN}" --appimage-extract
}

src_install() {
        keepdir /opt/jetbrains-toolbox
        insinto /opt/jetbrains-toolbox
        doins jetbrains-toolbox
        fperms +x /opt/jetbrains-toolbox/jetbrains-toolbox

        newicon squashfs-root/jetbrains-toolbox.svg "${PN}.svg"
	    sed -i '4c Exec=/usr/bin/jetbrains-toolbox' squashfs-root/${PN}.desktop

        make_wrapper "${PN}" /opt/jetbrains-toolbox/jetbrains-toolbox

        insinto /usr/share/applications
        doins "${WORKDIR}/${P}/squashfs-root/${PN}.desktop"
}

pkg_postinst() {
        xdg_desktop_database_update
}

pkg_postrm() {
        xdg_desktop_database_update
}

