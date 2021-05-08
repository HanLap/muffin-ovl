EAPI=7

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

src_install() {
    npm install
    npm run sub:init
    npm run build:watch


}
