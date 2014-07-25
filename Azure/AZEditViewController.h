//
//  AZEditViewController.h
//  Azure
//
//  Created by Brave Heart on 7/20/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct AddressObject
{
    __unsafe_unretained NSString *address;
    __unsafe_unretained NSString *value;
    BOOL locked;
}AddressObject;

@interface AZEditViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate>
{
    AddressObject data;
    IBOutlet UITextField *addressField, *valueField;
    IBOutlet UISwitch *lockedSwitch;
}

-(IBAction)dismissKeyboard:(id)sender;

@property (nonatomic) AddressObject data;
@property (nonatomic, retain) IBOutlet UITextField *addressField, *valueField;
@property (nonatomic, retain) IBOutlet UISwitch *lockedSwitch;
@end
