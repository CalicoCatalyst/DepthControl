ARCHS = arm64
TARGET = iphone:clang:11.2:11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = depthcontrol
depthcontrol_FILES = SDCRootListController.m
depthcontrol_INSTALL_PATH = /Library/PreferenceBundles
depthcontrol_FRAMEWORKS = UIKit
depthcontrol_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
depthcontrol_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/depthcontrol.plist$(ECHO_END)
