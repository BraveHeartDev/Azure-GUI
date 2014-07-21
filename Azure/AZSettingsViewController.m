//
//  AZSecondViewController.m
//  Azure
//
//  Created by Brave Heart on 7/13/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#import "AZSettingsViewController.h"

@interface AZSettingsViewController ()

@end

@implementation AZSettingsViewController
@synthesize startAddress, endAddress, maxSearch, applicationOnlySwitch;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

-(IBAction)dismissKeyboard:(id)sender
{
    if([startAddress isFirstResponder])
        [startAddress resignFirstResponder];
    else if([endAddress isFirstResponder])
        [endAddress resignFirstResponder];
    else if([maxSearch isFirstResponder])
        [maxSearch resignFirstResponder];
}

-(IBAction)resetDefaults:(id)sender
{
    startAddress.text = @"0x00000000";
    endAddress.text = @"0x7FFFFFFF";
    maxSearch.text = @"100000000";
    [applicationOnlySwitch setOn:YES animated:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == startAddress || textField == endAddress)
    {
        if([[string componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789xXaAbBcCdDeEfF"] invertedSet]] count] > 1)
            return false;
    }
    else if(textField == maxSearch)
    {
        if([[string componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] count] > 1)
            return false;
    }
    
    return true;
}
@end
