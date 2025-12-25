%global version 0.7.5
%global build_number 1503
%global hyphanet_user hyphanet
%global hyphanet_group hyphanet
%global install_dir /opt/hyphanet

Name:           hyphanet
Version:        %{version}.%{build_number}
Release:        1%{?dist}
Summary:        Anonymous peer-to-peer distributed data store

License:        GPL-2.0-or-later
URL:            https://www.hyphanet.org/
Source0:        https://github.com/hyphanet/fred/releases/download/build0%{build_number}/freenet-build0%{build_number}.jar
Source1:        https://github.com/hyphanet/fred/releases/download/build0%{build_number}/freenet-ext-29.jar
Source2:        hyphanet.service
Source3:        hyphanet.default
Source4:        wrapper.conf
Source5:        run.sh

BuildArch:      noarch
BuildRequires:  systemd-rpm-macros

Requires:       java-11-openjdk-headless
Requires:       systemd
Requires(pre):  shadow-utils

%description
Hyphanet (formerly Freenet) is free software which lets you anonymously share
files, browse and publish "freesites" (websites accessible only through
Hyphanet) and chat on forums, all without fear of censorship. Hyphanet is
decentralized to make it less vulnerable to attack, and if used in "darknet"
mode, where users only connect to their friends, is very difficult to detect.

Communications by Hyphanet nodes are encrypted and are routed through other
nodes to make it extremely difficult to determine who is requesting the
information and what its content is.

%prep
# Nothing to prep - using pre-built JARs

%build
# Nothing to build - Java application

%install
# Create directories
install -d -m 755 %{buildroot}%{install_dir}
install -d -m 755 %{buildroot}%{install_dir}/lib
install -d -m 750 %{buildroot}/var/lib/hyphanet
install -d -m 755 %{buildroot}%{_unitdir}
install -d -m 755 %{buildroot}%{_sysconfdir}/default
install -d -m 755 %{buildroot}%{_bindir}

# Install JAR files
install -m 644 %{SOURCE0} %{buildroot}%{install_dir}/freenet.jar
install -m 644 %{SOURCE1} %{buildroot}%{install_dir}/lib/freenet-ext.jar

# Install systemd service
install -m 644 %{SOURCE2} %{buildroot}%{_unitdir}/hyphanet.service

# Install default configuration
install -m 644 %{SOURCE3} %{buildroot}%{_sysconfdir}/default/hyphanet

# Install wrapper config
install -m 644 %{SOURCE4} %{buildroot}%{install_dir}/wrapper.conf

# Install run script
install -m 755 %{SOURCE5} %{buildroot}%{install_dir}/run.sh

# Create symlink for CLI access
ln -s %{install_dir}/run.sh %{buildroot}%{_bindir}/hyphanet

%pre
getent group %{hyphanet_group} >/dev/null || groupadd -r %{hyphanet_group}
getent passwd %{hyphanet_user} >/dev/null || \
    useradd -r -g %{hyphanet_group} -d /var/lib/hyphanet -s /sbin/nologin \
    -c "Hyphanet daemon user" %{hyphanet_user}
exit 0

%post
%systemd_post hyphanet.service
echo ""
echo "Hyphanet has been installed."
echo ""
echo "To start Hyphanet:"
echo "  sudo systemctl start hyphanet"
echo ""
echo "To enable Hyphanet at boot:"
echo "  sudo systemctl enable hyphanet"
echo ""
echo "Access the web interface at: http://127.0.0.1:8888/"
echo ""

%preun
%systemd_preun hyphanet.service

%postun
%systemd_postun_with_restart hyphanet.service

%files
%dir %{install_dir}
%dir %{install_dir}/lib
%{install_dir}/freenet.jar
%{install_dir}/lib/freenet-ext.jar
%{install_dir}/wrapper.conf
%{install_dir}/run.sh
%{_bindir}/hyphanet
%{_unitdir}/hyphanet.service
%config(noreplace) %{_sysconfdir}/default/hyphanet
%attr(750,%{hyphanet_user},%{hyphanet_group}) %dir /var/lib/hyphanet

%changelog
* Wed Dec 25 2024 Package Maintainer <maintainer@example.com> - 0.7.5.1503-1
- Initial RPM package for Hyphanet build 1503
- Hotfix release addressing thread leak and HTML display issues
