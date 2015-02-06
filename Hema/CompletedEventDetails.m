//
//  CompletedEventDetails.m
//  Hema
//
//  Created by Santanu Das Adhikary on 06/02/15.
//  Copyright (c) 2015 Hema. All rights reserved.
//

#import "CompletedEventDetails.h"
#import "UIColor+HexColor.h"
#import "WebserviceProtocol.h"
#import "UrlParameterString.h"
#import "GlobalModelObjects.h"
#import "GlobalStrings.h"
#import "MPApplicationGlobalConstants.h"
#import "MDIncrementalImageView.h"

@interface CompletedEventDetails()<UITableViewDataSource,UITableViewDelegate,WebserviceProtocolDelegate>
{
    CGRect mainFrame;
}

@property (nonatomic,retain) UITableView *DataContainTable;
@property (nonatomic,retain) NSMutableArray *DataContainArray;
@property (nonatomic,retain) UIActivityIndicatorView *DataContainActivity;
@property (nonatomic,retain) NSArray *TableSectionHeaderTextArray;
@property (nonatomic,retain) NSArray *DataStringArray;
@property (nonatomic,retain) NSMutableArray *TableviewDataArray;
@property (nonatomic,retain) UIActivityIndicatorView *MainActivity;
@property (nonatomic,retain) NSString *EventId;
@end

@implementation CompletedEventDetails

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil EventId:(NSString *)ParamEventId
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        mainFrame = [[UIScreen mainScreen] bounds];
        self.EventId = ParamEventId;
        self.view.layer.frame = CGRectMake(0, 0, mainFrame.size.width, mainFrame.size.height);
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
        _DataStringArray =[[NSArray alloc] initWithObjects:self.EventId, nil];
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            [self GetProviderAccountDetails];
        });
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:[self UIViewSetHeaderViewWithbackButton:YES]];
    [self.view addSubview:[self UIViewSetFooterView]];
    [self.view addSubview:[self UIViewSetHeaderNavigationViewWithSelectedTab:@"Dashboard"]];
    
    UILabel *WelcomeMessage = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, mainFrame.size.width-10, 20)];
    [WelcomeMessage setFont:[UIFont fontWithName:@"Arial" size:12.0f]];
    [WelcomeMessage setTextColor:[UIColor darkGrayColor]];
    [WelcomeMessage setBackgroundColor:[UIColor clearColor]];
    [WelcomeMessage setTextAlignment:NSTextAlignmentLeft];
    [WelcomeMessage setText:@"View Customer Information"];
    [self.view addSubview:WelcomeMessage];
    
    UILabel *WelcomeUnderline = [[UILabel alloc] initWithFrame:CGRectMake(10, 115, mainFrame.size.width-20, 1)];
    [WelcomeUnderline setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:WelcomeUnderline];
    
    self.DataContainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, mainFrame.size.width, mainFrame.size.height-180) style:UITableViewStylePlain];
    [self.DataContainTable setDelegate:self];
    [self.DataContainTable setDataSource:self];
    [self.DataContainTable setHidden:YES];
    [self.DataContainTable setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.DataContainTable];
    
    _DataContainActivity = [[UIActivityIndicatorView alloc] init];
    [_DataContainActivity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [_DataContainActivity setColor:[UIColor colorFromHex:0xe66a4c]];
    [_DataContainActivity startAnimating];
    [_DataContainActivity setHidesWhenStopped:YES];
    
    _TableSectionHeaderTextArray = [[NSArray alloc] initWithObjects:@"Event Title",@"Event Location",@"Company Name",@"Contact Name",@"Phone Number",@"Email Address",@"Number Of Guests",@"From Date",@"To Date",@"Closing Date",@"Signatory",@"Event Requirements",@"Budget",@"Contract Date",@"Prefered Alternate Location",@"Prefered Room Rate",@"Auxiliary Services", nil];
    
    CGRect frame = _DataContainActivity.frame;
    frame.origin.x = mainFrame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = mainFrame.size.height / 2 - frame.size.height / 2;
    _DataContainActivity.frame = frame;
    [self.view addSubview:_DataContainActivity];
}

#pragma Webservice Process

-(void)GetProviderAccountDetails
{
    if (!IS_NETWORK_AVAILABLE())
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            SHOW_NETWORK_ERROR_ALERT();
        });
    } else {
        WebserviceProtocol *Datadelegate = [[WebserviceProtocol alloc] initWithParamObject:UrlParameterString.WebParamCustomerViewCompletedEvent ValueObject:_DataStringArray UrlParameter:UrlParameterString.URLParamCustomerViewCompletedEvent];
        [Datadelegate setDelegate:self];
    }
}

/**
 *  Success
 */

-(void)RetunWebserviceDataWithSuccess:(WebserviceProtocol *)DataDelegate ObjectCarrier:(NSDictionary *)ParamObjectCarrier
{
   // NSLog(@"ParamObjectCarrier --- %@",ParamObjectCarrier);
    
    if ([[ParamObjectCarrier objectForKey:@"errorcode"]intValue] == 1) {
        
        self.TableviewDataArray = [[NSMutableArray alloc] init];
        
        NSLock* arrayLock = [[NSLock alloc] init];
        [arrayLock lock];
        
        for (id LocalObject in [ParamObjectCarrier objectForKey:@"event"]) {
            
            self.TableviewDataArray = [[NSMutableArray alloc] initWithObjects:[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"title"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"location"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"company_name"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"contact_name"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"phone"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"email_address"],@"2",[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"date_from"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"date_to"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"closing_date"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"signatory"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"event_requirements"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"budget"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"contract_date"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"preferred_alternate_location"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"preferred_room_rate"],[[ParamObjectCarrier objectForKey:@"event"] objectForKey:@"auxiliary_services"], nil];
            
        }
        [arrayLock unlock];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [_DataContainActivity stopAnimating];
            [_DataContainTable setHidden:NO];
            [_DataContainTable reloadData];
        });
    } else {
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            UIAlertView *dataAccessError = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[ParamObjectCarrier objectForKey:@"message"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [dataAccessError setTag:120];
            [dataAccessError show];
        });
    }
}

/**
 *  Error
 */

-(void)RetunWebserviceDataWithError:(WebserviceProtocol *)DataDelegate ObjectCarrier:(NSError *)ParamObjectCarrier
{
    NSLog(@"Error ParamObjectCarrier ---- %@",ParamObjectCarrier);
}

#pragma Tableview Datasorce Delegate Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *DataCell = [[UITableViewCell alloc] init];
    [DataCell.textLabel setText:[NSString stringWithFormat:@"%@",[self.TableviewDataArray objectAtIndex:indexPath.section]]];
    [DataCell.textLabel setTextColor:[UIColor darkGrayColor]];
    [DataCell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0f]];
    return DataCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_TableSectionHeaderTextArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma Tableview Delegate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *Headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.layer.frame.size.width, 30)];
    [Headerview setBackgroundColor:[UIColor colorFromHex:0xefefef]];
    UILabel *TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7.5, Headerview.frame.size.width, 15)];
    [TitleLabel setBackgroundColor:[UIColor clearColor]];
    [TitleLabel setTextColor:[UIColor darkGrayColor]];
    [TitleLabel setText:[_TableSectionHeaderTextArray objectAtIndex:section]];
    [TitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0f]];
    [Headerview addSubview:TitleLabel];
    return Headerview;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
