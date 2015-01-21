# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 toolchain-funcs

DESCRIPTION="2D/3D frequency domain denoiser"
HOMEPAGE="https://github.com/HomeOfVapourSynthEvolution/VapourSynth-DFTTest"
EGIT_REPO_URI="https://github.com/HomeOfVapourSynthEvolution/VapourSynth-DFTTest.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND+="
	media-libs/vapoursynth
    sci-libs/fftw:3.0
"
DEPEND="${RDEPEND}
"

LIBNAME="libdfttest.so"
INSTALLDIR="/usr/lib/vapoursynth/"

src_configure() {
    chmod +x configure
    ./configure --install="/usr/lib/vapoursynth" --extra-cxxflags="${CFLAGS}" --extra-ldflags="${LDFLAGS}"
}

src_install() {
        exeinto ${INSTALLDIR}
        doexe ${LIBNAME}
        dodoc README.md
}
