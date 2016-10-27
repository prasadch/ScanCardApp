//
//  SharedPersistance.h
//  ScanCardApp
//
//  Created by Ratheesh TR on 27/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardDetails.h"
@interface SharedPersistance : NSObject

+ (void)saveCardInfo:(CardDetails *)userObj;
+ (CardDetails *)getCardInfo;

@end
