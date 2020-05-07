#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python2-db
$(call Package/python2/Default)
  TITLE:=Python $(PYTHON_VERSION) db module
  DEPENDS:=+python2-base +libdb47
endef

$(eval $(call PyBasePackage,python2-db, \
	/usr/lib/python$(PYTHON_VERSION)/bsddb \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_bsddb.so \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/dbm.so \
))
