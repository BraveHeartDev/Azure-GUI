//
//  AZFirstViewController.m
//  Azure
//
//  Created by Brave Heart on 7/13/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#import "AZAzureViewController.h"

@interface AZAzureViewController ()

@end

@implementation AZAzureViewController
@synthesize table, runningApps, rowTitle, rowPID;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    runningApps = [[NSMutableArray alloc] init];
    
    AppObject app;
    app.appName = @"App1";
    app.appPID = @"435";
    
    AppObject app2;
    app2.appName = @"App2";
    app2.appPID = @"436";
    
    AppObject app3;
    app3.appName = @"App3";
    app3.appPID = @"437";
    
    AppObject app4;
    app4.appName = @"App4";
    app4.appPID = @"438";
    
    AppObject app5;
    app5.appName = @"App5";
    app5.appPID = @"439";
    
    AppObject app6;
    app6.appName = @"App6";
    app6.appPID = @"440";
    
    AppObject app7;
    app7.appName = @"App7";
    app7.appPID = @"441";
    
    AppObject app8;
    app8.appName = @"App8";
    app8.appPID = @"442";
    
    AppObject app9;
    app9.appName = @"App9";
    app9.appPID = @"443";
    
    AppObject app10;
    app10.appName = @"App10";
    app10.appPID = @"444";
    
    AppObject app11;
    app11.appName = @"App11";
    app11.appPID = @"445";
    
    [runningApps addObject:[NSValue valueWithBytes:&app objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app2 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app3 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app4 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app5 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app6 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app7 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app8 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app9 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app10 objCType:@encode(AppObject)]];
    [runningApps addObject:[NSValue valueWithBytes:&app11 objCType:@encode(AppObject)]];
    
    table.delegate = self;
    table.dataSource = self;
    rowPID = @"";
    rowTitle = @"";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 40.0f)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *App = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width * 3/4, 40)];
    App.text = @"Application Name";
    App.textAlignment = NSTextAlignmentCenter;
    App.textColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [view addSubview:App];
    
    UILabel *PID = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width * 3/4) + 10, 0, (self.view.bounds.size.width * 1/4) - 10, 40)];
    PID.text = @"PID";
    PID.textAlignment = NSTextAlignmentCenter;
    PID.textColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [view addSubview:PID];
    
    UIView *vertLine = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * 3/4, 0, 1, 40)];
    vertLine.backgroundColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [view addSubview:vertLine];
    
    UIView *horLine = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 1.0f)];
    horLine.backgroundColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [view addSubview:horLine];
    
    UIView *horLine2 = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 40.0f, self.view.bounds.size.width, 1.0f)];
    horLine2.backgroundColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [view addSubview:horLine2];
    
    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [runningApps count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppObject app;
    [[runningApps objectAtIndex:indexPath.row] getValue:&app];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    // Configure the cell...
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.accessoryType = UITableViewCellStyleDefault;
    
    UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 14.0 ];
    cell.textLabel.font  = myFont;
    cell.textLabel.text = app.appName;
    
    UIView *vertLine = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * 3/4, 0, 1, 40)];
    vertLine.backgroundColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [cell.contentView addSubview:vertLine];
    
    UILabel *PID = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width * 3/4) + 10, 0, (self.view.bounds.size.width * 1/4) - 10, 40)];
    PID.text = app.appPID;
    PID.tag = 1111;
    [cell.contentView addSubview:PID];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    [cell setBackgroundView:bgView];
    
    UIView *selBgView = [[UIView alloc] init];
    selBgView.backgroundColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [cell setSelectedBackgroundView:selBgView];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    rowTitle = cell.textLabel.text;
    for (UIView *view in cell.contentView.subviews) {
        if(view.tag == 1111)
            rowPID = ((UILabel*)view).text;
    }
    
    [table deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"SearchSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    AZSearchViewController *controller = [segue destinationViewController];
    controller.appName = [NSString stringWithFormat:@"Search %@",rowTitle];
    controller.appPID = rowPID;
}
@end
