#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python2-dev
$(call Package/python2/Default)
  TITLE:=Python $(PYTHON_VERSION) development files
  DEPENDS:=+python2-base
endef

define PyPackage/python2-dev/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/python*config $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python$(PYTHON_VERSION)/config/libpython$(PYTHON_VERSION).a $(1)/usr/lib
	$(SED) 's|$(TARGET_AR)|ar|g;s|$(TARGET_RANLIB)|ranlib|g;s|$(TARGET_CC)|gcc|g;s|$(TARGET_CXX)|g++|g' \
		$(PKG_INSTALL_DIR)/usr/lib/python$(PYTHON_VERSION)/config/Makefile
endef

$(eval $(call PyBasePackage,python2-dev, \
	/usr/lib/python$(PYTHON_VERSION)/config \
	/usr/include/python$(PYTHON_VERSION) \
	/usr/lib/pkgconfig \
	, \
	DO_NOT_ADD_TO_PACKAGE_DEPENDS \
))

