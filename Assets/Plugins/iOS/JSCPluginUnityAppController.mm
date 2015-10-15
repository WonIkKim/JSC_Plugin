
#import "UnityAppController.h"

@interface JSCPluginUnityAppController : UnityAppController

@end


@implementation JSCPluginUnityAppController

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"url recieved: %@", url);
    NSLog(@"query string: %@", [url query]);
    NSLog(@"host: %@", [url host]);
    NSLog(@"url path: %@", [url path]);
    NSDictionary *dict = [self parseQueryString:[url query]];
    NSLog(@"query dict: %@", dict);
	//URL Scheme 데이터가 있으면 쉐어드에 저장
	
    return YES;
}

@end

IMPL_APP_CONTROLLER_SUBCLASS(JSCPluginUnityAppController);