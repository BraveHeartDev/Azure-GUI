//
//  AZSecondViewController.h
//  Azure
//
//  Created by Brave Heart on 7/13/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AZSettingsViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *startAddress, *endAddress, *maxSearch;
    IBOutlet UISwitch *applicationOnlySwitch;
}

-(IBAction)dismissKeyboard:(id)sender;
-(IBAction)resetDefaults:(id)sender;

@property (nonatomic, retain) IBOutlet UITextField *startAddress, *endAddress, *maxSearch;
@property (nonatomic, retain) IBOutlet UISwitch *applicationOnlySwitch;
@end
