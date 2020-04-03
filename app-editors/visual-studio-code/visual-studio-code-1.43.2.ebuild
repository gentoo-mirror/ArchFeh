# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="Code editing. Redefined. Free. Built on open source. Runs everywhere."
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="https://go.microsoft.com/fwlink/?LinkID=620884 -> ${P}-amd64.tar.gz"
RESTRICT="mirror"

LICENSE="Microsoft"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libsecret"

DEPEND="
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2
	x11-libs/cairo
	gnome-base/gconf
"
RDEPEND="
	${DEPEND}
	libsecret? ( app-crypt/libsecret[crypt] )
"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	ARCH="$(uname -m)"
	if [[ $ARCH == "x86_64" ]];then
		cd VSCode-linux-x64
	else
		cd VSCode-linux-ia32
	fi


	insinto "/opt/${PN}"
	doins -r *
	dosym "/opt/${PN}/code" "/usr/bin/visual-studio-code"
	insinto "/usr/share/applications"
	doins ${FILESDIR}/${PN}.desktop
	insinto "/usr/share/pixmaps"
	doins ${FILESDIR}/${PN}.png
	fperms +x "/opt/${PN}/code"
	fperms +x "/opt/${PN}/bin/code"
	fperms +x "/opt/${PN}/libffmpeg.so"
	fperms +x "/opt/${PN}/libEGL.so"
	fperms +x "/opt/${PN}/libGLESv2.so"
}

pkg_postinst(){
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
