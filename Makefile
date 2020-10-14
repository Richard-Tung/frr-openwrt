#
# Copyright (C) 2019 Lucian Cristian <lucian.cristian@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=frr
PKG_RELEASE:=1
PKG_SOURCE_VERSION:=7.3.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_HASH:=f4ddb95a737aff2765a9847a24462ec4b45a623fb17430b00f94705a853a16fd
PKG_SOURCE_URL:=https://github.com/FRRouting/frr/releases/download/frr-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)
#HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)/frr-$(PKG_NAME)-$(PKG_SOURCE_VERSION)

#UNPACK_CMD:=tar zxvf "$(DL_DIR)/$(PKG_SOURCE)" -C "$(PKG_BUILD_DIR)/"
UNPACK_CMD:=tar zxvf "$(DL_DIR)/$(PKG_SOURCE)" -C "$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)"
#MAKE_PATH:=frr-$(PKG_NAME)-$(PKG_SOURCE_VERSION)

PKG_CONFIG_DEPENDS:= \
	CONFIG_IPV6 \
	CONFIG_PACKAGE_frr-babeld \
	CONFIG_PACKAGE_frr-bfdd \
	CONFIG_PACKAGE_frr-bgpd \
	CONFIG_PACKAGE_frr-eigrpd \
	CONFIG_PACKAGE_frr-fabricd \
	CONFIG_PACKAGE_frr-isisd \
	CONFIG_PACKAGE_frr-ldpd \
	CONFIG_PACKAGE_frr-libfrr \
	CONFIG_PACKAGE_frr-libfrrcares \
	CONFIG_PACKAGE_frr-nhrpd \
	CONFIG_PACKAGE_frr-ospfd \
	CONFIG_PACKAGE_frr-ospf6d \
	CONFIG_PACKAGE_frr-pbrd \
	CONFIG_PACKAGE_frr-pimd \
	CONFIG_PACKAGE_frr-ripd \
	CONFIG_PACKAGE_frr-ripngd \
	CONFIG_PACKAGE_frr-staticd \
	CONFIG_PACKAGE_frr-vrrpd \
	CONFIG_PACKAGE_frr-vtysh \
	CONFIG_PACKAGE_frr-watchfrr \
	CONFIG_PACKAGE_frr-zebra

PKG_BUILD_PARALLEL:=1
PKG_BUILD_DEPENDS:=python3/host
#prepare for the yet not workyng host build
#PKG_BUILD_DEPENDS:=python3/host frr/host
#HOST_BUILD_DEPENDS:=python3/host
PKG_FIXUP:=autoreconf
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/frr/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  DEPENDS:=frr
  TITLE:=The FRRouting (FRR) Software Routing Suite
  URL:=https://www.frrouting.org/
  MAINTAINER:=Lucian Cristian <lucian.cristian@gmail.com>
endef

define Package/frr
  $(call Package/frr/Default)
  DEPENDS:=+librt
  MENU:=1
endef

define Package/frr/description
  FRRouting is free software that implements and manages various IPv4 and IPv6
  routing protocols.

  Currently FRRouting supports BGP4, BGP4+, OSPFv2, OSPFv3, RIPv1, RIPv2, RIPng,
  IS-IS, PIM-SM/MSDP, LDP and Babel as well as very early support for EIGRP and
  NHRP.
endef

define Package/frr-babeld
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=BABEL routing engine
endef

define Package/frr-bfdd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=BFD routing engine
endef

define Package/frr-bgpd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=BGPv4, BGPv4+, BGPv4- routing engine
endef

define Package/frr-eigrpd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=EIGRPD routing engine
endef

define Package/frr-fabricd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=OpenFabric routing engine
endef

define Package/frr-isisd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=IS-IS routing engine
endef

define Package/frr-ldpd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=LDP routing engine
endef

define Package/frr-libfrr
  $(call Package/frr/Default)
  TITLE:=zebra library
  DEPENDS+=+libjson-c +libyang
endef

define Package/frr-libfrrcares
  $(call Package/frr/Default)
  TITLE:=libfrrcares library
  DEPENDS+=+libcares +libjson-c 
endef

define Package/frr-nhrpd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr +frr-libfrrcares
  TITLE:=NHRP routing engine
endef

define Package/frr-ospfd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=OSPFv2 routing engine
endef

define Package/frr-ospf6d
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr @IPV6
  TITLE:=OSPFv3 routing engine
endef

define Package/frr-pbrd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=PBRD routing daemon
endef

define Package/frr-pimd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=PIM routing engine
endef

define Package/frr-ripd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=RIP routing engine
endef

define Package/frr-ripngd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr @IPV6
  TITLE:=RIPNG routing engine
endef

define Package/frr-staticd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=STATICD routing engine
endef

define Package/frr-vrrpd
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr
  TITLE:=VRRPD routing engine
endef

define Package/frr-vtysh
  $(call Package/frr/Default)
  DEPENDS+=+frr-libfrr +libreadline +libncurses
  TITLE:=integrated shell for frr routing software
endef

define Package/frr-watchfrr
  $(call Package/frr/Default)
  TITLE:=frr watchdog
  DEPENDS+=+frr-libfrr
  DEFAULT:=y if PACKAGE_frr
endef

define Package/frr-zebra
  $(call Package/frr/Default)
  TITLE:=Zebra daemon
  DEPENDS+=+frr-libfrr
  DEFAULT:=y if PACKAGE_frr
endef

define Package/frr-libfrr/conffiles
/etc/frr/
endef

define Package/frr-vtysh/conffiles
/etc/frr/vtysh.conf
endef

#MAKE_PATH = ./build
#CONFIGURE_PATH = ./build

#it's still buggy
HOST_CONFIGURE_ARGS += \
    --enable-clippy-only="yes"

define Build/Prepare
	$(Build/Prepare/Default)
	mkdir -p $(PKG_BUILD_DIR)/build/lib
	$(CP) $(PKG_BUILD_DIR)/lib/command.h $(PKG_BUILD_DIR)/build/lib/
endef

define Build/Configure
    ( cd $(PKG_BUILD_DIR)/build/ ; \
    cd build ; \
    ../configure \
	--host="$(GNU_TARGET_NAME)" \
	--build="$(GNU_HOST_NAME)" \
	CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)" \
	HOST_CFLAGS="$(HOST_CFLAGS)" \
	HOST_LDFLAGS="$(HOST_LDFLAGS)" \
	BUILD_CPPFLAGS="$(TARGET_CPPLAGS)" \
	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
	BUILD_LDFLAGS="$(TARGET_LDFLAGS)" \
	--prefix=/usr \
	--enable-shared \
	--enable-user=network \
	--enable-group=network \
	--enable-multipath=16 \
	--disable-capabilities \
	--disable-ospfclient \
	--disable-doc \
	--with-vtysh-pager=cat \
	--localstatedir=/var/run/frr \
	--sysconfdir=/etc/frr/ \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-babeld,babeld) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-bfdd,bfdd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-bgpd,bgpd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-eigrpd,eigrpd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-fabricd,fabricd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-isisd,isisd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-ldpd,ldpd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-nhrpd,nhrpd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-ospfd,ospfd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-ospf6d,ospf6d) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-pbrd,pbrd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-pimd,pimd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-staticd,staticd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-ripd,ripd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-ripngd,ripngd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-vrrpd,vrrpd) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-vtysh,vtysh) \
	$(call autoconf_bool,CONFIG_PACKAGE_frr-libfrr,zebra) \
)
endef
#	--with-libyang-pluginsdir="/usr/lib/libyang/user_types" \
#	--with-yangmodelsdir="/usr/lib/libyang" \

#	just speed it up
NUM_CORES ?= $(shell grep -c "vendor_id" /proc/cpuinfo)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/build -j$(NUM_CORES)
endef

define Package/frr/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/frrcommon.sh $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/frr $(1)/etc/init.d/
endef

define Package/frr-watchfrr/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/watchfrr.sh $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/watchfrr/.libs/watchfrr $(1)/usr/sbin/
endef

define Package/frr-zebra/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/zebra/.libs/zebra $(1)/usr/sbin/
endef

define Package/frr-babeld/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/babeld/.libs/babeld $(1)/usr/sbin/
endef

define Package/frr-bfdd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bfdd/.libs/bfdd $(1)/usr/sbin/
endef

define Package/frr-bgpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bgpd/.libs/bgpd $(1)/usr/sbin/
endef

define Package/frr-eigrpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/eigrpd/.libs/eigrpd $(1)/usr/sbin/
endef

define Package/frr-fabricd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/isisd/.libs/fabricd $(1)/usr/sbin/
endef

define Package/frr-isisd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/isisd/.libs/isisd $(1)/usr/sbin/
endef

define Package/frr-ldpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/ldpd/.libs/ldpd $(1)/usr/sbin/
endef

define Package/frr-nhrpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/nhrpd/.libs/nhrpd $(1)/usr/sbin/
endef

define Package/frr-ospfd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/ospfd/.libs/ospfd $(1)/usr/sbin/
endef

define Package/frr-ospf6d/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/ospf6d/.libs/ospf6d $(1)/usr/sbin/
endef

define Package/frr-pbrd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/pbrd/.libs/pbrd $(1)/usr/sbin/
endef

define Package/frr-pimd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/pimd/.libs/pimd $(1)/usr/sbin/
endef

define Package/frr-ripd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/ripd/.libs/ripd $(1)/usr/sbin/
endef

define Package/frr-ripngd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/ripngd/.libs/ripngd $(1)/usr/sbin/
endef

define Package/frr-staticd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/staticd/.libs/staticd $(1)/usr/sbin/
endef

define Package/frr-vrrpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/vrrpd/.libs/vrrpd $(1)/usr/sbin/
endef

define Package/frr-vtysh/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/vtysh/.libs/vtysh $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/frr
	$(INSTALL_CONF) ./files/vtysh.conf $(1)/etc/frr/
endef

define Package/frr-libfrr/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/build/lib/.libs/libfrr.so* $(1)/usr/lib/
#	$(INSTALL_DIR) $(1)/usr/lib/libyang/user_types
#	$(CP) $(PKG_BUILD_DIR)/yang/frr-* $(1)/usr/lib/libyang/
	$(INSTALL_DIR) $(1)/etc/frr
	chmod 0750 $(1)/etc/frr
	$(INSTALL_CONF) ./files/{frr.conf,daemons} $(1)/etc/frr/
endef

define Package/frr-libfrrcares/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/build/lib/.libs/libfrrcares.so* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,frr))
$(eval $(call BuildPackage,frr-babeld))
$(eval $(call BuildPackage,frr-bfdd))
$(eval $(call BuildPackage,frr-bgpd))
$(eval $(call BuildPackage,frr-eigrpd))
$(eval $(call BuildPackage,frr-fabricd))
$(eval $(call BuildPackage,frr-isisd))
$(eval $(call BuildPackage,frr-ldpd))
$(eval $(call BuildPackage,frr-libfrr))
$(eval $(call BuildPackage,frr-libfrrcares))
$(eval $(call BuildPackage,frr-nhrpd))
$(eval $(call BuildPackage,frr-ospfd))
$(eval $(call BuildPackage,frr-ospf6d))
$(eval $(call BuildPackage,frr-pbrd))
$(eval $(call BuildPackage,frr-pimd))
$(eval $(call BuildPackage,frr-ripd))
$(eval $(call BuildPackage,frr-ripngd))
$(eval $(call BuildPackage,frr-staticd))
$(eval $(call BuildPackage,frr-vrrpd))
$(eval $(call BuildPackage,frr-vtysh))
$(eval $(call BuildPackage,frr-watchfrr))
$(eval $(call BuildPackage,frr-zebra))
