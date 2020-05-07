#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python2-multiprocessing
$(call Package/python2/Default)
  TITLE:=Python $(PYTHON_VERSION) multiprocessing
  DEPENDS:=+python2-base
endef

$(eval $(call PyBasePackage,python2-multiprocessing, \
	/usr/lib/python$(PYTHON_VERSION)/multiprocessing \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_multiprocessing.so \
))
