################################################################################
#
# DPDK
#
################################################################################

ifeq ($(BR2_DPDK_23.07RC),y)
DPDK_VERSION = 23.07-rc3
else
DPDK_VERSION = 23.03
endif

DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.gz

DPDK_LICENSE = BSD-2c (core), GPLv2 (Linux drivers)
DPDK_LICENSE_FILES = GNUmakefile LICENSE.GPL
DPDK_INSTALL_STAGING = YES

DPDK_DEPENDENCIES += numactl host-pkgconf host-python-pyelftools

ifeq ($(BR2_PACKAGE_LIBPCAP),y)
DPDK_DEPENDENCIES += libpcap
endif

# ifeq ($(BR2_SHARED_LIBS),y)
# define DPDK_ENABLE_SHARED_LIBS
#   $(call KCONFIG_ENABLE_OPT,CONFIG_RTE_BUILD_SHARED_LIB,\
#       $(@D)/build/.config)
# endef
# DPDK_POST_CONFIGURE_HOOKS = DPDK_ENABLE_SHARED_LIBS
# endif
#

DPDK_CONF_OPTS += -Dcpu_instruction_set=generic

$(eval $(meson-package))
