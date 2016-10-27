//
//  ViewController.m
//  ScanCardApp
//
//  Created by Ratheesh TR on 26/10/16.
//  Copyright © 2016 Ratheesh TR. All rights reserved.
//

#import "FetchCardDetails.h"
#import "CardDetails.h"
#import "SharedPersistance.h"

@interface FetchCardDetails ()
{
    CardDetails *cardDetails;
    SharedPersistance *sharedPersistance;
}
@end

@implementation FetchCardDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [CardIOUtilities preloadCardIO];
}


- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    
    NSLog(@"User canceled payment info");
    // Handle user cancellation here...
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    
    [self displyingDetailsAfterScanning:info];
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Textfield Delegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
        return YES;
}

#pragma mark - validation

- (BOOL)cardDetailsValidation {
    
    
    if (txtFieldCardNo.text.length ==0 ){
        
        [self showAlertWithMessage:@"Enter valid card number"];
        return NO;
    }
    else if (txtFieldExpiryDate.text.length == 0 ){

        [self showAlertWithMessage:@"Enter valid Expiry date"];
        return NO;
    }
    else if (txtFieldCvv.text.length == 0 ){
        
        [self showAlertWithMessage:@"Enter valid CVV number"];
        return NO;
    }
   else if (txtFieldName.text.length == 0) {
        [self showAlertWithMessage:@"Enter cardholder Name"];
        return NO;
    }
    else
        return YES;
}

#pragma mark - Private methods

-(void)displyingDetailsAfterScanning:(CardIOCreditCardInfo *)info{
    
    if (info.cardholderName)
        txtFieldName.text = info.cardholderName;
    txtFieldCardNo.text = info.cardNumber;
    txtFieldExpiryDate.text = [NSString stringWithFormat:@"%02lu/%lu",(unsigned long)info.expiryMonth, (unsigned long)info.expiryYear];
    txtFieldCvv.text = info.cvv;
    
    [self saveCardDetails];
}

-(void)saveCardDetails{
    
    cardDetails = [[CardDetails alloc]init];
    if (txtFieldName.text.length)
        cardDetails.name = txtFieldName.text;
    cardDetails.cardNo = txtFieldCardNo.text;
    cardDetails.expiry_date = txtFieldExpiryDate.text;
    cardDetails.cvvNo = txtFieldCvv.text;
    
    [SharedPersistance saveCardInfo:cardDetails];
    
}

- (void)showAlertWithMessage:(NSString*)msg{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * action)
                            {
                                [alert dismissViewControllerAnimated:YES completion:nil];
                                
                            }];
    [alert addAction:okBtn];
    
    [self presentViewController:alert animated:YES completion:nil];

}

#pragma mark - Button Actions

- (IBAction)scanCard:(id)sender {
    
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    [self presentViewController:scanViewController animated:YES completion:nil];
}

- (IBAction)submitAction:(id)sender {
    
    [self.view endEditing:YES];
    if ([self cardDetailsValidation]) {
        [self saveCardDetails];
        [self performSegueWithIdentifier:@"SegueInfo" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
