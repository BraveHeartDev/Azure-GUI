//
//  AZSearchViewController.m
//  Azure
//
//  Created by Brave Heart on 7/13/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//
#import "AZAzureViewController.h"
#import "AZSearchViewController.h"
#define LOCKEDCOLOR [UIColor colorWithRed:0.0f/255.0f green:205.0f/255.0f blue:255.0f/255.0f alpha:1.0f]

@interface AZSearchViewController ()

@end

@implementation AZSearchViewController
@synthesize appName, appPID, rowTitle, foundAddresses, table, rowValue, rowLocked, rowNumber;

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
    
    self.title = self.appName;
    self.appName = [appName stringByReplacingOccurrencesOfString:@"Search " withString:@""];
    
    foundAddresses = [[NSMutableArray alloc] init];
    
    AddressObject Address;
    Address.address = @"0x10000000";
    Address.value = @"435";
    Address.locked = true;
    
    AddressObject Address2;
    Address2.address = @"0x10000004";
    Address2.value = @"435";
    Address2.locked = false;
    
    AddressObject Address3;
    Address3.address = @"0x10000008";
    Address3.value = @"435";
    Address3.locked = true;
    
    AddressObject Address4;
    Address4.address = @"0x1000000C";
    Address4.value = @"435";
    Address4.locked = false;
    
    AddressObject Address5;
    Address5.address = @"0x10000010";
    Address5.value = @"435";
    Address5.locked = false;
    
    AddressObject Address6;
    Address6.address = @"0x10000014";
    Address6.value = @"435";
    Address6.locked = true;
    
    AddressObject Address7;
    Address7.address = @"0x10000018";
    Address7.value = @"435";
    Address7.locked = false;
    
    AddressObject Address8;
    Address8.address = @"0x1000001C";
    Address8.value = @"435";
    Address8.locked = false;
    
    AddressObject Address9;
    Address9.address = @"0x10000020";
    Address9.value = @"435";
    Address9.locked = false;
    
    AddressObject Address10;
    Address10.address = @"0x10000024";
    Address10.value = @"435";
    Address10.locked = false;
    
    AddressObject Address11;
    Address11.address = @"0x10000028";
    Address11.value = @"435";
    Address11.locked = true;
    
    [foundAddresses addObject:[NSValue valueWithBytes:&Address objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address2 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address3 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address4 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address5 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address6 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address7 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address8 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address9 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address10 objCType:@encode(AddressObject)]];
    [foundAddresses addObject:[NSValue valueWithBytes:&Address11 objCType:@encode(AddressObject)]];
    
    table.delegate = self;
    table.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    UILabel *Address = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width * 3/4, 40)];
    Address.text = @"Address";
    Address.textAlignment = NSTextAlignmentCenter;
    Address.textColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [view addSubview:Address];
    
    UILabel *Value = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width * 3/4) + 10, 0, (self.view.bounds.size.width * 1/4) - 10, 40)];
    Value.text = @"Value";
    Value.textAlignment = NSTextAlignmentCenter;
    Value.textColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [view addSubview:Value];
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [foundAddresses count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressObject Address;
    [[foundAddresses objectAtIndex:indexPath.row] getValue:&Address];
    
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
    cell.textLabel.text = Address.address;
    
    UIView *vertLine = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * 3/4, 0, 1, 40)];
    vertLine.backgroundColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [cell.contentView addSubview:vertLine];
    
    UILabel *Value = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width * 3/4) + 10, 0, (self.view.bounds.size.width * 1/4) - 10, 40)];
    Value.text = Address.value;
    Value.tag = 1111;
    [cell.contentView addSubview:Value];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    [cell setBackgroundView:bgView];
    
    UIView *selBgView = [[UIView alloc] init];
    selBgView.backgroundColor = [UIColor colorWithRed:0.0f green:127.0f/255.0f blue:1.0f alpha:1.0f];
    [cell setSelectedBackgroundView:selBgView];
    
    if(Address.locked)
    {
        UIView *BgView = [[UIView alloc] init];
        BgView.backgroundColor = LOCKEDCOLOR;
        [cell setBackgroundView:BgView];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    rowTitle = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    for (UIView *view in cell.contentView.subviews) {
        if(view.tag == 1111)
            rowValue = ((UILabel*)view).text;
    }
    
    CGFloat r, g, b, a;
    [[cell backgroundView].backgroundColor getRed:&r green:&g blue:&b alpha:&a];
    CGFloat rConst, gConst, bConst, aConst;
    [LOCKEDCOLOR getRed:&rConst green:&gConst blue:&bConst alpha:&aConst];
    
    rowLocked = (r == rConst && g == gConst && b == bConst);
    
    rowNumber = indexPath;
    [table deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"EditSegue" sender:self];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //Search Code Here
    [searchBar resignFirstResponder];
}

#pragma mark - Navigation

// In a storyboard-based Addresslication, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    AZEditViewController *controller = [segue destinationViewController];
    AddressObject data;
    data.address = rowTitle;
    data.value = rowValue;
    data.locked = rowLocked;
    
    controller.data = data;
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if([viewController isKindOfClass:[AZAzureViewController class]])
    {
        self.navigationController.delegate = ((AZAzureViewController*)viewController);
    }
}
@end
