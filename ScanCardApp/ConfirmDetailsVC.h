//
//  ConfirmDetailsVC.h
//  ScanCardApp
//
//  Created by Ratheesh TR on 27/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmDetailsVC : UIViewController
{
    
    IBOutlet UILabel *lblCardNo;
    IBOutlet UILabel *blbName;
    IBOutlet UILabel *lblExpiryDate;
    IBOutlet UILabel *lblCvv;
}
- (IBAction)doneAction:(id)sender;

@end
