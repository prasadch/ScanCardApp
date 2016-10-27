//
//  CardDetails.h
//  ScanCardApp
//
//  Created by Ratheesh TR on 27/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardDetails : NSObject

@property (nonatomic, strong) NSString *cardNo;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *expiry_date;
@property (nonatomic, strong) NSString *cvvNo;

@end
