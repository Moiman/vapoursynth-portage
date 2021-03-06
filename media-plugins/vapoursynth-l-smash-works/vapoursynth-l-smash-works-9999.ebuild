# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=5

inherit toolchain-funcs multilib

DESCRIPTION="Works based on L-SMASH project"
HOMEPAGE="https://github.com/VFR-maniac/L-SMASH-Works"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/VFR-maniac/L-SMASH-Works.git"
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/VFR-maniac/L-SMASH-Works/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
fi

LICENSE="GPL-2"
KEYWORDS=""
IUSE="-debug"
SLOT="0"

RDEPEND+="
	=media-libs/l-smash-${PV}
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

S="${WORKDIR}/${P}/VapourSynth"

src_prepare() {
	sed -i -e "s:CC=\"gcc\":CC=\"$(tc-getCC)\":" configure || die
	sed -i -e "s:LD=\"gcc\":LD=\"$(tc-getCC)\":" configure || die
}

src_configure() {
	./configure --prefix="${ROOT}/usr" --extra-cflags="${CFLAGS}" --extra-ldflags="${LDFLAGS}" || die
}
