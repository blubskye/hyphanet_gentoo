# Hyphanet Gentoo ebuild
# Copyright (C) 2024 blubskye
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Source: https://github.com/blubskye/hyphanet_gentoo

EAPI=8

inherit systemd

DESCRIPTION="Anonymous peer-to-peer distributed data store (formerly Freenet)"
HOMEPAGE="https://www.hyphanet.org/"

BUILD_NUMBER="01503"
SRC_URI="
	https://github.com/hyphanet/fred/releases/download/build${BUILD_NUMBER}/freenet-build${BUILD_NUMBER}.jar -> ${P}.jar
	https://github.com/hyphanet/fred/releases/download/build${BUILD_NUMBER}/freenet-ext-29.jar -> ${P}-ext.jar
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

RDEPEND="
	>=virtual/jre-11:*
	acct-user/hyphanet
	acct-group/hyphanet
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
	# JAR files don't need unpacking
	:
}

src_install() {
	# Install directories
	insinto /opt/hyphanet
	doins "${DISTDIR}/${P}.jar"
	dosym "${P}.jar" /opt/hyphanet/freenet.jar

	insinto /opt/hyphanet/lib
	doins "${DISTDIR}/${P}-ext.jar"
	dosym "${P}-ext.jar" /opt/hyphanet/lib/freenet-ext.jar

	# Install configuration files
	insinto /opt/hyphanet
	doins "${FILESDIR}/wrapper.conf"

	# Install run script
	exeinto /opt/hyphanet
	doexe "${FILESDIR}/run.sh"

	# Create symlink for CLI access
	dosym /opt/hyphanet/run.sh /usr/bin/hyphanet

	# Install default config
	insinto /etc/default
	doins "${FILESDIR}/hyphanet.default"
	dosym hyphanet.default /etc/default/hyphanet

	# Create data directory
	keepdir /var/lib/hyphanet
	fowners hyphanet:hyphanet /var/lib/hyphanet
	fperms 0750 /var/lib/hyphanet

	# Install systemd service
	if use systemd; then
		systemd_dounit "${FILESDIR}/hyphanet.service"
	fi

	# Install OpenRC init script
	newinitd "${FILESDIR}/hyphanet.initd" hyphanet
	newconfd "${FILESDIR}/hyphanet.confd" hyphanet
}

pkg_postinst() {
	elog ""
	elog "Hyphanet has been installed."
	elog ""
	if use systemd; then
		elog "To start Hyphanet with systemd:"
		elog "  sudo systemctl start hyphanet"
		elog ""
		elog "To enable Hyphanet at boot:"
		elog "  sudo systemctl enable hyphanet"
	else
		elog "To start Hyphanet with OpenRC:"
		elog "  sudo rc-service hyphanet start"
		elog ""
		elog "To enable Hyphanet at boot:"
		elog "  sudo rc-update add hyphanet default"
	fi
	elog ""
	elog "Access the web interface at: http://127.0.0.1:8888/"
	elog ""
}
