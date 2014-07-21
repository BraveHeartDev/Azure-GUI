//
//  AZSearchViewController.h
//  Azure
//
//  Created by Brave Heart on 7/13/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZEditViewController.h"

@interface AZSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UINavigationControllerDelegate>
{
    IBOutlet UITableView *table;
    NSMutableArray *foundAddresses;
    NSString *appName;
    NSString *appPID;
    NSString *rowTitle, *rowValue;
    BOOL rowLocked;
    NSIndexPath *rowNumber;
}

@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) NSMutableArray *foundAddresses;
@property (nonatomic, retain) NSString *appName, *appPID;
@property (nonatomic, retain) NSString *rowTitle, *rowValue;
@property (nonatomic) BOOL rowLocked;
@property (nonatomic, retain) NSIndexPath *rowNumber;
@end
