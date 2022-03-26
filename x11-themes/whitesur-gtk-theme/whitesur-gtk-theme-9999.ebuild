# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="MacOS Big Sur like theme for Gnome desktops"
HOMEPAGE="https://github.com/vinceliuice/WhiteSur-gtk-theme"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	SRC_URI="https://github.com/vinceliuice/WhiteSur-gtk-theme/archive/refs/tags/${PV//./-}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
	S="${WORKDIR}/WhiteSur-gtk-theme-${PV//./-}"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="dev-lang/sassc
	dev-libs/glib
	dev-libs/libxml2
	x11-libs/gtk+:2
	>=x11-libs/gtk+-3.18:3
	x11-themes/gtk-engines-murrine"
RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${ED}/usr/share/themes"
	./install.sh \
	--monterey \
	--icon gnome \
	--dest "${ED}/usr/share/themes"
}
