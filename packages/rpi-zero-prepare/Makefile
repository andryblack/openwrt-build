#
# Copyright (C) 2020-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rpi-zero-prepare
PKG_VERSION:=1.0.0
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/rpi-zero-prepare
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=Initialize RPi zero
  DEPENDS:=+fdisk +e2fsprogs +uci +kmod-usb-gadget-serial +kmod-usb-dwc2 +wireless-tools +@BUSYBOX_CONFIG_GETTY
endef

define Package/rpi-zero-prepare/description
 Initialize RPi zero wifi and data partition
endef


define Build/Configure
	
endef

define Build/Compile
	
endef

define Package/rpi-zero-prepare/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/update-settings.init $(1)/etc/init.d/update-settings
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/up-wifi.defaults $(1)/etc/uci-defaults/90-up-wifi
	$(INSTALL_BIN) ./files/serial-clean.defaults $(1)/etc/uci-defaults/90-serial-clean
	$(INSTALL_BIN) ./files/data-partitions.defaults $(1)/etc/uci-defaults/91-data-partitions
	$(INSTALL_BIN) ./files/groups-add.defaults $(1)/etc/uci-defaults/10-groups-add
	##sed '/^DATA_PARTITION_OFFSET /s/=.*$/= $(DATA_PARTITION_OFFSET)/' $(1)/etc/uci-defaults/91-data-partitions
	$(INSTALL_DIR) $(1)/etc/modules.d
endef

$(eval $(call BuildPackage,rpi-zero-prepare))
