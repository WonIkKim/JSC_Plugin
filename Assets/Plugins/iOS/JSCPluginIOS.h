//
//  JSCPluginIOS.h
//  Unity-iPhone
//
//  Created by RoSangseon on 2015. 10. 15..
//
//

#import <Foundation/Foundation.h>

@interface JSCPluginIOS : NSObject


+ (id)getInstance;


- (const char*)getURLScheme:(NSString*) paramKey;
- (const char*)testCall;

- (NSString*)parseQueryString:(NSString*)_query paramKey:(NSString*)pKey;

@end
