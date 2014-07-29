################################################################################
#
# Intel GPU Tools
#
################################################################################

INTEL_GPU_TOOLS_VERSION = 1.7
INTEL_GPU_TOOLS_SOURCE = intel-gpu-tools-$(INTEL_GPU_TOOLS_VERSION).tar.bz2
INTEL_GPU_TOOLS_SITE = http://xorg.freedesktop.org/archive/individual/app/
INTEL_GPU_TOOLS_LICENSE = MIT
INTEL_GPU_TOOLS_LICENSE_FILES = COPYING

INTEL_GPU_TOOLS_INSTALL_STAGING = YES
INTEL_GPU_TOOLS_AUTORECONF = YES

INTEL_GPU_TOOLS_DEPENDENCIES = libdrm
INTEL_GPU_TOOLS_DEPENDENCIES += cairo

$(eval $(autotools-package))
