//
//  JSCPluginIOS.m
//  Unity-iPhone
//
//  Created by RoSangseon on 2015. 10. 15..
//
//

#import "JSCPluginIOS.h"

@implementation JSCPluginIOS

+ (id)getInstance{
    static dispatch_once_t pred;
    static JSCPluginIOS* _instance = nil;
    
    dispatch_once(&pred, ^{
        _instance = [[JSCPluginIOS alloc] init];
    });
    
    return _instance;
}


- (const char*)getURLScheme:(NSString*) paramKey{
    NSString* paramVal = nil;
    
    NSString* strUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"jsc_url_scheme"];
    if (strUrl) {
        paramVal = [self parseQueryString:strUrl paramKey:paramKey];
    }

    return [paramVal UTF8String];
}

- (const char*)testCall{
    NSString* strTest = @"test";
    return [strTest UTF8String];
}

- (NSString*)parseQueryString:(NSString*)_query paramKey:(NSString*)pKey{
    NSMutableDictionary* pDic = [NSMutableDictionary dictionary];
    NSArray* pairs = [_query componentsSeparatedByString:@"&"];
    
    for (NSString* sObj in pairs) {
        NSArray* elements = [sObj componentsSeparatedByString:@"="];
        
        NSString* key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        if ([pKey isEqualToString:key]) {
            return [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        
    }
    
    return nil;
}
@end

#pragma mark - extern
#if __cplusplus
extern "C" {
#endif

    const char* _getUrlScheme(const char* paramKey){
        return [[JSCPluginIOS getInstance] getURLScheme:[NSString stringWithUTF8String:paramKey]];
    }
    
    const char* _testCall(){
        return [[JSCPluginIOS getInstance] testCall];
    }
#if __cplusplus
}
#endif
