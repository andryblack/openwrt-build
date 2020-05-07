#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python2-openssl
$(call Package/python2/Default)
  TITLE:=Python $(PYTHON_VERSION) SSL module
  DEPENDS:=+python2-base +libopenssl
endef

$(eval $(call PyBasePackage,python2-openssl, \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_hashlib.so \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/_ssl.so \
))
