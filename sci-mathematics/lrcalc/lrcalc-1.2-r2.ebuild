# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Littlewood-Richardson Calculator"
HOMEPAGE="http://www.math.rutgers.edu/~asbuch/lrcalc/"
SRC_URI="http://math.rutgers.edu/~asbuch/lrcalc/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/1"
KEYWORDS="~amd64 ~x86 ~ppc-macos ~x64-macos ~x86-macos"
IUSE="static-libs"

RESTRICT="mirror"

DEPEND=""
RDEPEND=""

PATCHES=(
	"${FILESDIR}"/${PN}-1.2-includes.patch
	)

src_configure(){
	econf \
		$(use_enable static-libs static)
}

src_install(){
	default
	# remove .la file
	find "${ED}" -name '*.la' -delete || die
}
