EAPI=8

DESCRIPTION="Pulseaudio command line mixer."
HOMEPAGE="https://github.com/cdemoulins/pamixer"

inherit git-r3 meson
EGIT_REPO_URI="https://github.com/cdemoulins/pamixer"

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/boost
	dev-libs/cxxopts
	media-sound/pulseaudio
	media-sound/pulseaudio-daemon[alsa]"

DEPEND="${RDEPEND}"

src_configure() {
  meson_src_configure
}

src_install() {
	# dobin ${PN}
	# dodoc README.rst

  meson_src_install
}