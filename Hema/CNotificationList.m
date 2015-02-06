//
//  CNotificationList.m
//  Hema
//
//  Created by Mac on 12/01/15.
//  Copyright (c) 2015 Hema. All rights reserved.
//

#import "CNotificationList.h"
#import "UIColor+HexColor.h"
#import "UITextField+Attribute.h"
#import "UITextView+Extentation.h"
#import "WebserviceProtocol.h"
#import "UrlParameterString.h"
#import "GlobalModelObjects.h"
#import "GlobalStrings.h"
#import "MPApplicationGlobalConstants.h"

@interface CNotificationList ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,WebserviceProtocolDelegate>
{
    CGRect mainFrame;
    NSArray *dataTitleArray;
}

@property (nonatomic,retain) UIScrollView * MainScrollView;
@property (nonatomic,retain) UITableView  * DataContainerView;
@property (nonatomic,retain) UIActivityIndicatorView *DataContainActivity;
@property (nonatomic,retain) NSArray *HeaderContainerArray;
@property (nonatomic,retain) NSArray *DataStringArray;
@property (nonatomic,retain) NSMutableArray *TableDataArray;
@property (nonatomic,retain) NSMutableArray *CategoryArray;
@end

@implementation CNotificationList

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        mainFrame = [[UIScreen mainScreen] bounds];
        self.view.layer.frame = CGRectMake(0, 0, mainFrame.size.width, mainFrame.size.height);
        [self.view setBackgroundColor:[UIColor whiteColor]];
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
    [WelcomeMessage setText:@"View Notifications"];
    [self.view addSubview:WelcomeMessage];
    
    UILabel *WelcomeUnderline = [[UILabel alloc] initWithFrame:CGRectMake(10, 115, mainFrame.size.width-20, 1)];
    [WelcomeUnderline setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:WelcomeUnderline];
    
    _MainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height-181)];
    [_MainScrollView setUserInteractionEnabled:YES];
    [_MainScrollView setContentSize:CGSizeMake(600, self.view.frame.size.height-181)];
    [_MainScrollView setDelegate:self];
    [_MainScrollView setBounces:NO];
    [self.view addSubview:_MainScrollView];
    
    _DataContainerView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 1200, _MainScrollView.layer.frame.size.height) style:UITableViewStylePlain];
    [_DataContainerView setDelegate:self];
    [_DataContainerView setDataSource:self];
    [_DataContainerView setBounces:NO];
    [_DataContainerView setHidden:YES];
    [_DataContainerView setBackgroundColor:[UIColor clearColor]];
    [_MainScrollView addSubview:_DataContainerView];
    
    CGRect frame = _DataContainActivity.frame;
    frame.origin.x = mainFrame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = mainFrame.size.height / 2 - frame.size.height / 2;
    _DataContainActivity.frame = frame;
    [self.view addSubview:_DataContainActivity];
    
    _DataStringArray =[[NSArray alloc] initWithObjects:[self Getlogedinuserid], nil];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [self GetProviderServiceListDetails];
    });
}

#pragma webservice data delegate

-(void)GetProviderServiceListDetails
{
    if (!IS_NETWORK_AVAILABLE())
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            SHOW_NETWORK_ERROR_ALERT();
        });
    } else {
        WebserviceProtocol *Datadelegate = [[WebserviceProtocol alloc] initWithParamObject:UrlParameterString.WebParamCustomerNotification ValueObject:self.DataStringArray UrlParameter:UrlParameterString.URLParamCustomerNotification];
        [Datadelegate setDelegate:self];
    }
}

-(void)RetunWebserviceDataWithSuccess:(WebserviceProtocol *)DataDelegate ObjectCarrier:(NSDictionary *)ParamObjectCarrier
{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        
        if ([[ParamObjectCarrier objectForKey:@"errorcode"] intValue] == 1) {
            
            self.TableDataArray = [[NSMutableArray alloc] init];
            for (id WEbdetailsData in [ParamObjectCarrier objectForKey:@"notification"]) {
                
                CustomerNotificationList *LocalObject = [[CustomerNotificationList alloc] initWithCNotificationId:[WEbdetailsData objectForKey:@"id"] CNotificationTitle:[WEbdetailsData objectForKey:@"title"] CNotificationCustomerId:[WEbdetailsData objectForKey:@"customer_id"] CNotificationEventId:[WEbdetailsData objectForKey:@"event_id"] CNotificationIsCompleated:[WEbdetailsData objectForKey:@"is_compleated"] CNotificationNotificationComment:[WEbdetailsData objectForKey:@"notification_comment"] CNotificationNotificationTime:[WEbdetailsData objectForKey:@"notification_time"] CNotificationIsBlocked:[WEbdetailsData objectForKey:@"is_blocked"] CNotificationIsRead:[WEbdetailsData objectForKey:@"is_read"]];
                
                [self.TableDataArray addObject:LocalObject];
            }
            [_DataContainActivity stopAnimating];
            [_DataContainerView setHidden:NO];
            [_DataContainerView reloadData];
            
        } else if ([[ParamObjectCarrier objectForKey:@"errorcode"] intValue] == 2) {
            
            UIAlertView *DataAlert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[ParamObjectCarrier objectForKey:@"message"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [DataAlert setTag:120];
            [DataAlert show];
            
        } else {
            UIAlertView *DataAlert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[ParamObjectCarrier objectForKey:@"message"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [DataAlert setTag:120];
            [DataAlert show];
        }
    });
}
-(void)RetunWebserviceDataWithError:(WebserviceProtocol *)DataDelegate ObjectCarrier:(NSError *)ParamObjectCarrier
{
    UIAlertView *DataAlert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[NSString stringWithFormat:@"%@",ParamObjectCarrier] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [DataAlert setTag:120];
    [DataAlert show];
}

#pragma Tableview Datasorce Delegate Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *DataCell = [[UITableViewCell alloc] init];
    
    float SeperaterLabelDiff = 150.0f;
    float NextSeperaterPosition = 0.0f;
    
    CustomerNotificationList *LocalObject = [self.TableDataArray objectAtIndex:indexPath.row];
    
    for (int i=0; i<=dataTitleArray.count; i++) {
        
        if (i == dataTitleArray.count-1) {
            
            UILabel *SeperaterLabel = [[UILabel alloc] initWithFrame:CGRectMake(NextSeperaterPosition, 0, 1, DataCell.contentView.layer.frame.size.height+5)];
            [SeperaterLabel setBackgroundColor:[UIColor lightGrayColor]];
            [DataCell.contentView addSubview:SeperaterLabel];
            
            UIButton *ViewDetailsButton = [[UIButton alloc] initWithFrame:CGRectMake(NextSeperaterPosition+30 ,5, 100, 40)];
            [ViewDetailsButton setBackgroundColor:[UIColor colorFromHex:0xffffff]];
            [ViewDetailsButton setTitle:@"View" forState:UIControlStateNormal];
            [ViewDetailsButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0f]];
            [ViewDetailsButton.layer setCornerRadius:2.0f];
            [ViewDetailsButton addTarget:self action:@selector(ViewDetails:) forControlEvents:UIControlEventTouchUpInside];
            [ViewDetailsButton.layer setBorderColor:[UIColor colorFromHex:0xe66a4c].CGColor];
            [ViewDetailsButton.layer setBorderWidth:1.0f];
            [ViewDetailsButton setTitleColor:[UIColor colorFromHex:0xe66a4c] forState:UIControlStateNormal];
            [ViewDetailsButton setTag:7777+indexPath.row];
            [DataCell addSubview:ViewDetailsButton];
            
        } else {
            
            UILabel *TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(NextSeperaterPosition, 5.5, SeperaterLabelDiff, 15)];
            [TitleLabel setBackgroundColor:[UIColor clearColor]];
            [TitleLabel setTextColor:[UIColor darkTextColor]];
            
            switch (i) {
                case 0:
                    [TitleLabel setText:[NSString stringWithFormat:@"%@",[LocalObject CNotificationTitle]]];
                    break;
                case 1:
                    [TitleLabel setText:[NSString stringWithFormat:@"%@",[LocalObject CNotificationIsCompleated]]];
                    break;
                case 2:
                    [TitleLabel setText:[NSString stringWithFormat:@"%@",[LocalObject CNotificationNotificationComment]]];
                    break;
            }
            [TitleLabel setNumberOfLines:0];
            [TitleLabel setTextAlignment:NSTextAlignmentCenter];
            [TitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0f]];
            [DataCell.contentView addSubview:TitleLabel];
            
            UILabel *SeperaterLabel = [[UILabel alloc] initWithFrame:CGRectMake(NextSeperaterPosition, 0, 1, DataCell.contentView.layer.frame.size.height+5)];
            [SeperaterLabel setBackgroundColor:[UIColor lightGrayColor]];
            [DataCell.contentView addSubview:SeperaterLabel];
            
            NextSeperaterPosition = NextSeperaterPosition+SeperaterLabelDiff;
        }
    }
    [DataCell.textLabel setTextColor:[UIColor darkGrayColor]];
    [DataCell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0f]];
    return DataCell;
}

-(IBAction)ViewDetails:(UIButton *)sender
{
    CustomerNotificationList *LocalObject = [self.TableDataArray objectAtIndex:(sender.tag - 7777)];
    
    NSString *DataString = [NSString stringWithFormat:@"Status Change To : %@ \n Admin Comment: %@",[LocalObject CNotificationIsCompleated],[LocalObject CNotificationNotificationComment]];
    
    UIAlertView *dataAlert = [[UIAlertView alloc] initWithTitle:[LocalObject CNotificationTitle] message:DataString delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
    [dataAlert show];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.TableDataArray.count;
}

#pragma Tableview Delegate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    float SeperaterLabelDiff = 150.0f;
    float NextSeperaterPosition = 0.0f;
    
    UIView *Headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.layer.frame.size.width, 60)];
    [Headerview setBackgroundColor:[UIColor colorFromHex:0xc5c5c5]];
    
    dataTitleArray = [[NSArray alloc] initWithObjects:@"Event Title",@"Event Status",@"Notifications",@"View", nil];
    
    for (int i=0; i<=3; i++) {
        
        UILabel *TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(NextSeperaterPosition, 20.5, SeperaterLabelDiff, 15)];
        [TitleLabel setBackgroundColor:[UIColor clearColor]];
        [TitleLabel setTextColor:[UIColor darkTextColor]];
        [TitleLabel setText:[dataTitleArray objectAtIndex:i]];
        [TitleLabel setTextAlignment:NSTextAlignmentCenter];
        [TitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0f]];
        [Headerview addSubview:TitleLabel];
        
        UILabel *SeperaterLabel = [[UILabel alloc] initWithFrame:CGRectMake(NextSeperaterPosition, 0, 1, Headerview.layer.frame.size.height)];
        [SeperaterLabel setBackgroundColor:[UIColor lightGrayColor]];
        [Headerview addSubview:SeperaterLabel];
        
        NextSeperaterPosition = NextSeperaterPosition+SeperaterLabelDiff;
        
    }
    
    return Headerview;
}

/**
 *  Tableview select row
 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
