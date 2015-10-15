
#import "UnityAppController.h"

@interface JSCPluginUnityAppController : UnityAppController

@end


@implementation JSCPluginUnityAppController

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    if (!url) {
        return NO;
    }
    
    NSString* urlScheme = [url scheme];
    NSString* urlHost = [url host];
    
    if ([@"jscplugin" isEqualToString:urlScheme] && [@"com.jscgames.urlscheme" isEqualToString:urlHost]) {
        [[NSUserDefaults standardUserDefaults] setObject:[url absoluteString] forKey:@"jsc_url_scheme"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
	
    return YES;
}

@end

IMPL_APP_CONTROLLER_SUBCLASS(JSCPluginUnityAppController);