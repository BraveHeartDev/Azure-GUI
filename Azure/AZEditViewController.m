//
//  AZEditViewController.m
//  Azure
//
//  Created by Brave Heart on 7/20/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#import "AZSearchViewController.h"
#import "AZEditViewController.h"

@interface AZEditViewController ()

@end

@implementation AZEditViewController
@synthesize data, addressField, valueField, lockedSwitch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
    
    addressField.text = data.address;
    valueField.text = data.value;
    [lockedSwitch setOn:data.locked animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == addressField)
        return false;
    else
    {
        if([[string componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] count] > 1)
            return false;
    }
    return true;
}

-(IBAction)dismissKeyboard:(id)sender
{
    if([addressField isFirstResponder])
        [addressField resignFirstResponder];
    else if([valueField isFirstResponder])
        [valueField resignFirstResponder];
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if([viewController isKindOfClass:[AZSearchViewController class]])
    {
        self.navigationController.delegate = ((AZSearchViewController*)viewController);
        
        AddressObject Address;
        Address.address = (__bridge NSString *)((__bridge_retained void *)addressField.text);
        Address.value = (__bridge NSString *)((__bridge_retained void *)valueField.text);
        Address.locked = lockedSwitch.isOn;
        
        [((AZSearchViewController*)viewController).foundAddresses replaceObjectAtIndex:((AZSearchViewController*)viewController).rowNumber.row withObject:[NSValue valueWithBytes:&Address objCType:@encode(AddressObject)]];
        
        [((AZSearchViewController*)viewController).table reloadData];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
