//
//  Settings.h
//  
//
//  Created by Stephen on 12/28/13.
//
// Raw data storing

#import <Foundation/Foundation.h>

@interface Storage : NSObject

+ (Storage*) sharedStorage;

- (void) saveValue:(id)value forKey:(NSString*)key;
- (id) getValueForKey:(NSString *)key defaultingTo:(id)val;
- (id) getValueForKey:(NSString*)key;

@end
