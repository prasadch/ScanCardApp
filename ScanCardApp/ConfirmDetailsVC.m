//
//  ConfirmDetailsVC.m
//  ScanCardApp
//
//  Created by Ratheesh TR on 27/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import "ConfirmDetailsVC.h"
#import "CardDetails.h"
#import "SharedPersistance.h"
@interface ConfirmDetailsVC ()
{
    CardDetails *cardDetails;
}
@end

@implementation ConfirmDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    cardDetails = [SharedPersistance getCardInfo];
    lblCardNo.text = cardDetails.cardNo;
    lblCvv.text = cardDetails.cvvNo;
    lblExpiryDate.text = cardDetails.expiry_date;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneAction:(id)sender {
}
@end
