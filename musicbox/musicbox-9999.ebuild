# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python2_7 python3_{5,6,7} pypy3)
inherit git-r3 distutils-r1

DESCRIPTION="A sexy command line interface musicbox for NetEase based on Python"
HOMEPAGE="https://github.com/darknessomi/musicbox"
SRC_URI=""
EGIT_REPO_URI="https://github.com/darknessomi/musicbox"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-sound/mpg123 dev-python/pycryptodomex dev-python/requests dev-python/future dev-python/requests-cache"
RDEPEND="${DEPEND}"
BDEPEND=""

python_install(){
distutils-r1_python_install
}

