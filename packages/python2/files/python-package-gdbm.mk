#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python2-gdbm
$(call Package/python2/Default)
  TITLE:=Python $(PYTHON_VERSION) gdbm module
  DEPENDS:=+python2-base +libgdbm
endef

$(eval $(call PyBasePackage,python2-gdbm, \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/gdbm.so \
))
