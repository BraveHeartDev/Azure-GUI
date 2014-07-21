//
//  AZFirstViewController.h
//  Azure
//
//  Created by Brave Heart on 7/13/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZSearchViewController.h"

typedef struct AppObject
{
    __unsafe_unretained NSString *appName;
    __unsafe_unretained NSString *appPID;
}AppObject;

@interface AZAzureViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>
{
    IBOutlet UITableView *table;
    NSMutableArray *runningApps;
    NSString *rowTitle;
    NSString *rowPID;
}

@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) NSMutableArray *runningApps;
@property (nonatomic, retain) NSString *rowTitle, *rowPID;
@end
