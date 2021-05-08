EAPI=7

inherit git-r3

DESCRIPTION="Bitwarden password manager command line interface"
HOMEPAGE="https://bitwarden.com/"
EGIT_REPO_URI="https://github.com/bitwarden/cli.git"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

RESTRICT=strip

src_unpack() {
    git-r3_src_unpack

    cd ${S}
    npm install || die
    npm run sub:init

    touch noop.js &&
    npx pkg noop.js --out-path build --targets linux-x64 &&
    rm -rf build &&
    rm noop.js ||
    die
}

src_compile() {
    npm run dist:lin
}

src_install() {
    dobin dist/linux/bw
}
