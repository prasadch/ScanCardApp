//
//  CardDetails.m
//  ScanCardApp
//
//  Created by Ratheesh TR on 27/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import "CardDetails.h"

@implementation CardDetails
@synthesize cardNo,name,cvvNo,expiry_date;

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.cardNo forKey:@"card_no"];
    [encoder encodeObject:self.name forKey:@"card_name"];
    [encoder encodeObject:self.expiry_date forKey:@"expiry_date"];
    [encoder encodeObject:self.cvvNo forKey:@"cvv_no"];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    if((self = [super init])) {
        
        //decode properties, other class vars
        self.cardNo = [decoder decodeObjectForKey:@"card_no"];
        self.name = [decoder decodeObjectForKey:@"card_name"];
        self.expiry_date = [decoder decodeObjectForKey:@"expiry_date"];
        self.cvvNo = [decoder decodeObjectForKey:@"cvv_no"];
    
    }
    return self;
}

@end
