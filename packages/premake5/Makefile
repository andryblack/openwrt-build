#
# Copyright (C) 2020-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=premake5
PKG_VERSION:=5.0.0-alpha14
PKG_RELEASE:=1

PKG_SOURCE:=premake-$(PKG_VERSION)-src.zip
PKG_SOURCE_URL:=https://github.com/premake/premake-core/releases/download/v5.0.0-alpha14/
PKG_HASH:=f26699599c53865f7b154e9ed22a0ba4
PKG_CAT:=unzip


HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/premake-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/premake-$(PKG_VERSION)


include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/premake5
  SECTION:=utils
  CATEGORY:=Development
  TITLE:=projects generator
  #BUILDONLY:=1
endef



define Package/premake5/description
  tool that generates various projects
endef

define Build/Configure
endef

ifeq ($(HOST_OS),Darwin)
	PREMAKE5_OS:=macosx
else
	ifeq ($(HOST_OS),FreeBSD)
		PREMAKE5_OS:=bsd
	else
		PREMAKE5_OS:=unix
	endif
endif

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) -f build/gmake.$(PREMAKE5_OS)
endef

define Package/premake5/Install
  #tool that generates various projects
endef

define Host/Configure
endef

define Host/Compile
	+$(HOST_MAKE_VARS) $(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR)/build/gmake.$(PREMAKE5_OS) -f Makefile
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/bin/
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/bin/release/premake5 $(STAGING_DIR_HOSTPKG)/bin/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,premake5))
