# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.64.0
QTMIN=5.12.3
#CMAKE_IN_SOURCE_BUILD=true
#CMAKE_MAKEFILE_GENERATOR=emake

inherit git-r3

#if [[ ${KDE_BUILD_TYPE} = release ]]; then
#	SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"
#	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
#fi

DESCRIPTION="Elegant dock, based on KDE Frameworks"
HOMEPAGE="https://kde.org/applications/utilities/org.kde.latte-dock"
EGIT_REPO_URI="git://anongit.kde.org/latte-dock.git"
LICENSE="GPL-2+"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"
# drop qtdeclarative subslot operator when QT_MINIMAL >= 5.14.0
DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5=
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	|| (
		>=dev-qt/qtgui-${QTMIN}:5[X(-)]
		>=dev-qt/qtgui-${QTMIN}:5[xcb(-)]
	)
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtx11extras-${QTMIN}:5
	>=kde-frameworks/kactivities-${KFMIN}:5
	>=kde-frameworks/karchive-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kglobalaccel-${KFMIN}:5
	>=kde-frameworks/kguiaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/knewstuff-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kpackage-${KFMIN}:5
	>=kde-frameworks/kwayland-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5[X]
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libxcb
"
RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
"

DOCS=( CHANGELOG.md README.md )

src_configure(){
cd ${WORKDIR}/${P}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DKDE_L10N_AUTO_TRANSLATIONS=OFF -DENABLE_MAKE_UNIQUE=$enable_make_unique -DCMAKE_BUILD_TYPE=$build_type ..
}

src_compile(){
cd ${WORKDIR}/${P}/build
make
}

src_install(){
cd ${WORKDIR}/${P}/build
emake DESTDIR="${D}" install
}
