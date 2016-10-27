//
//  ViewController.h
//  ScanCardApp
//
//  Created by Ratheesh TR on 26/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIO.h"
@interface FetchCardDetails : UIViewController<CardIOPaymentViewControllerDelegate>
{
    
    IBOutlet UITextField *txtFieldCardNo;
    IBOutlet UITextField *txtFieldExpiryDate;
    IBOutlet UITextField *txtFieldName;
    IBOutlet UITextField *txtFieldCvv;
}
- (IBAction)submitAction:(id)sender;
@end

