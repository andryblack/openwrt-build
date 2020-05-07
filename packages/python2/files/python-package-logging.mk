#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#


$(eval $(call PyBasePackage,python2-logging, \
	/usr/lib/python$(PYTHON_VERSION)/logging \
))
