# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-group

DESCRIPTION="Group for Hyphanet daemon"
ACCT_GROUP_ID=-1

acct-group_add_deps
