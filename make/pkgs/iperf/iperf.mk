$(call PKG_INIT_BIN, $(if $(FREETZ_PACKAGE_IPERF_VERSION_ABANDON),3.3,3.16))
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.gz
$(PKG)_HASH_ABANDON:=6f596271251056bffc11bbb8f17d4244ad9a7d4a317c2459fdbb853ae51284d8
$(PKG)_HASH_CURRENT:=cc740c6bbea104398cc3e466befc515a25896ec85e44a662d5f4a767b9cf713e
$(PKG)_HASH:=$($(PKG)_HASH_$(if $(FREETZ_PACKAGE_IPERF_VERSION_ABANDON),ABANDON,CURRENT))
$(PKG)_SITE:=https://downloads.es.net/pub/iperf
### WEBSITE:=https://iperf.fr/
### MANPAGE:=https://iperf.fr/iperf-doc.php
### CHANGES:=https://github.com/esnet/iperf/tags
### CVSREPO:=https://github.com/esnet/iperf

$(PKG)_CONDITIONAL_PATCHES+=$(if $(FREETZ_PACKAGE_IPERF_VERSION_ABANDON),abandon,current)
$(PKG)_PATCH_POST_CMDS += $(call PKG_ADD_EXTRA_FLAGS,LDFLAGS|LIBS)

$(PKG)_BINARY:=$($(PKG)_DIR)/src/iperf3
$(PKG)_TARGET_BINARY:=$($(PKG)_DEST_DIR)/usr/bin/iperf

$(PKG)_REBUILD_SUBOPTS += FREETZ_PACKAGE_IPERF_WITH_OPENSSL
$(PKG)_REBUILD_SUBOPTS += FREETZ_PACKAGE_IPERF_STATIC

ifneq ($(strip $(FREETZ_PACKAGE_IPERF_VERSION_ABANDON)),y)
$(PKG)_DEPENDS_ON += libatomic
$(PKG)_EXTRA_LIBS += -latomic
endif

$(PKG)_CONFIGURE_OPTIONS += --disable-shared
ifeq ($(strip $(FREETZ_PACKAGE_IPERF_WITH_OPENSSL)),y)
$(PKG)_REBUILD_SUBOPTS += FREETZ_OPENSSL_SHLIB_VERSION
$(PKG)_DEPENDS_ON += openssl
$(PKG)_CONFIGURE_OPTIONS += --with-openssl="$(TARGET_TOOLCHAIN_STAGING_DIR)/usr"
ifeq ($(strip $(FREETZ_PACKAGE_IPERF_STATIC)),y)
$(PKG)_EXTRA_LIBS += $(OPENSSL_LIBCRYPTO_EXTRA_LIBS)
$(PKG)_EXTRA_LDFLAGS += -all-static
endif
else
$(PKG)_CONFIGURE_OPTIONS += --without-openssl
endif


$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(IPERF_DIR)/src \
		EXTRA_LDFLAGS="$(IPERF_EXTRA_LDFLAGS)" \
		EXTRA_LIBS="$(IPERF_EXTRA_LIBS)" \
		iperf3

$($(PKG)_TARGET_BINARY): $($(PKG)_BINARY)
	$(INSTALL_BINARY_STRIP)

$(pkg):

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)


$(pkg)-clean:
	-$(SUBMAKE1) -C $(IPERF_DIR) clean
	$(RM) $(IPERF_DIR)/.configured

$(pkg)-uninstall:
	$(RM) $(IPERF_TARGET_BINARY)

$(PKG_FINISH)
