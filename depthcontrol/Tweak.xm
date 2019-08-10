#import <UIKit/UIKit.h>

static BOOL tweakEnabled = YES;


#define kIdentifier @"com.llama.depthcontrol"
#define kSettingsChangedNotification (CFStringRef)@"com.llama.depthcontrol/settingschanged"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.llama.depthcontrol.plist"



NSDictionary *prefs = nil;

static void reloadPrefs() {
	if ([NSHomeDirectory() isEqualToString:@"/var/mobile"]) {
		CFArrayRef keyList = CFPreferencesCopyKeyList((CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
		if (keyList) {
			prefs = (NSDictionary *)CFPreferencesCopyMultiple(keyList, (CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
			if (!prefs) {
				prefs = [NSDictionary new];
			}
			CFRelease(keyList);
		}
	} else {
		prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
	}
}

static BOOL boolValueForKey(NSString *key, BOOL defaultValue) {
	return (prefs && [prefs objectForKey:key]) ? [[prefs objectForKey:key] boolValue] : defaultValue;
}
/*
static CGFloat doubleValuePerApp(NSString *appId, NSString *prefix, CGFloat defaultValue) {
	if (prefs) {
		for (NSString *key in [prefs allKeys]) {
			if ([key hasPrefix:prefix]) {
				NSString *tempId = [key substringFromIndex:[prefix length]];
				if ([tempId isEqualToString:appId]) {
					return [prefs objectForKey:key] ? [[prefs objectForKey:key] floatValue] : defaultValue;
				}
			}
		}
	}
	return defaultValue;
}

static BOOL boolValuePerApp(NSString *appId, NSString *prefix, BOOL defaultValue) {
	if (prefs) {
		for (NSString *key in [prefs allKeys]) {
			if ([key hasPrefix:prefix]) {
				NSString *tempId = [key substringFromIndex:[prefix length]];
				if ([tempId isEqualToString:appId]) {
					return [prefs objectForKey:key] ? [[prefs objectForKey:key] boolValue] : defaultValue;
				}
			}
		}
	}
	return defaultValue;
}

static NSString *stringValueForKey(NSString *key, NSString *defaultValue) {
	return (prefs && [prefs objectForKey:key]) ? [prefs objectForKey:key] : defaultValue;
}
*/
static void preferencesChanged() {
	CFPreferencesAppSynchronize((CFStringRef)kIdentifier);
	reloadPrefs();

	tweakEnabled = boolValueForKey(@"dcenabled", YES);
}

%ctor {
	preferencesChanged();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesChanged, kSettingsChangedNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
@interface CAMCaptureCapabilities
@end

%hook CAMCaptureCapabilities

-(bool) isDepthEffectApertureSupported {
	if (tweakEnabled) {
		return TRUE;
	}else{
		return FALSE;
	}
}
%end

@interface FigCaptureSourceVideoFormat
@end

%hook FigCaptureSourceVideoFormat

-(float)minSimulatedAperture {
	if (tweakEnabled) {
		return 1.4;
	}else{
		return 1.4;
	}
}

-(float)maxSimulatedAperture {
	if (tweakEnabled) {
		return 16;
	}else{
		return 16;
	}
}

-(float)defaultSimulatedAperture {
	if (tweakEnabled) {
		return 4.5;
	}else{
		return 4.5;
	}
}
%end

@interface AVCaptureDeviceFormat
@end

%hook AVCaptureDeviceFormat

-(float)minSimulatedAperture {
	if (tweakEnabled) {
		return 1.4;
	}else{
		return 1.4;
	}
}

-(float)maxSimulatedAperture {
	if (tweakEnabled) {
		return 16;
	}else{
		return 16;
	}
}

-(float)defaultSimulatedAperture {
	if (tweakEnabled) {
		return 4.5;
	}else{
		return 4.5;
	}
}
%end

@interface PUCropToolController
@end

%hook PUCropToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}
%end

@interface PUFiltersToolController
@end

%hook PUFiltersToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}
%end

@interface PUAdjustmentsToolController
@end

%hook PUAdjustmentsToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}
%end

@interface PURedeyeToolController
@end

%hook PURedeyeToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		%orig(argument);
	}else{
		%orig(argument);
	}
}
%end



@interface CAMViewfinderViewController
@end

%hook CAMViewfinderViewController

-(bool) _shouldEnableApertureButton {
	if (tweakEnabled) {
		return TRUE;
	}else{
		return FALSE;
	}
}
%end

@interface CAMApertureButton : UIView
@end

%hook CAMApertureButton
-(void) layoutSubviews {
  %orig;
  NSArray *subs = [self.subviews[0] subviews];
  for (UIView *subview in subs) {
    UILabel *label = (UILabel *)subview;
    NSString *labelText = (NSString *)@"ƒ";
    label.text = labelText;
  }
}
%end
