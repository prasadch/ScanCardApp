//
//  SharedPersistance.m
//  ScanCardApp
//
//  Created by Ratheesh TR on 27/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import "SharedPersistance.h"

@implementation SharedPersistance

+ (void)saveCardInfo:(CardDetails *)userObj
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userObj];
    [userDefaults setObject:encodedObject forKey:@"Card_Info"];
    [userDefaults synchronize];
}


+ (CardDetails *)getCardInfo {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [userDefaults objectForKey:@"Card_Info"];
    CardDetails *userObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return userObj;
}
@end
