//
//  CChangePassword.m
//  Hema
//
//  Created by Mac on 12/01/15.
//  Copyright (c) 2015 Hema. All rights reserved.
//

#import "CChangePassword.h"
#import "UIColor+HexColor.h"
#import "UITextField+Attribute.h"
#import "UITextView+Extentation.h"
#import "NSString+PJR.h"
#import "UIColor+HexColor.h"
#import "MPApplicationGlobalConstants.h"
#import "WebserviceProtocol.h"
#import "UrlParameterString.h"
#import "GlobalModelObjects.h"
#import "NSString+PJR.h"

@interface CChangePassword ()<UIScrollViewDelegate,UITextFieldDelegate,UIAlertViewDelegate,WebserviceProtocolDelegate>
@property (nonatomic,retain) UIScrollView *MainScrollView;
@property (nonatomic,retain) UIView *HeaderNavigationViewBackgroundView;

@property (nonatomic,retain) UITextField * TFPassword;
@property (nonatomic,retain) UITextField * TFCPassword;
@property (nonatomic,retain) UIButton * SubmitButton;
@property (nonatomic,retain) NSArray  *DataStringArray;
@end

@implementation CChangePassword

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:[self UIViewSetHeaderViewWithbackButton:YES]];
    [self.view addSubview:[self UIViewSetFooterView]];
    [self.view addSubview:[self UIViewSetHeaderNavigationViewWithSelectedTab:@"Dashboard"]];
    
    _MainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height-150)];
    [_MainScrollView setUserInteractionEnabled:YES];
    [_MainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 500)];
    [_MainScrollView setDelegate:self];
    [self.view addSubview:_MainScrollView];
    
    UILabel *WelcomeMessage = [[UILabel alloc] initWithFrame:CGRectMake(10, 15,  self.view.frame.size.width-10, 20)];
    [WelcomeMessage setFont:[UIFont fontWithName:@"Arial" size:12.0f]];
    [WelcomeMessage setTextColor:[UIColor darkGrayColor]];
    [WelcomeMessage setBackgroundColor:[UIColor clearColor]];
    [WelcomeMessage setTextAlignment:NSTextAlignmentLeft];
    [WelcomeMessage setText:@"Change Password"];
    [_MainScrollView addSubview:WelcomeMessage];
    
    UILabel *WelcomeUnderline = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.view.frame.size.width-20, 1)];
    [WelcomeUnderline setBackgroundColor:[UIColor lightGrayColor]];
    [_MainScrollView addSubview:WelcomeUnderline];
    
    //float StatingYPosition = 50.0f;
    float Difference       = 50.0f;
    float LastPosition     = 70.0f;
    int nextdatatag        = 2001;
    float TextfieldWidth   = self.view.frame.size.width-40;
    float TextfieldHeight  = 40;
    float TextfieldXposition  = 20;
    float SubmitButtonWidth = 140.0f;
    float SubmitButtonHeight = 40.0f;
    float SubmitButtonxposition = (self.view.frame.size.width-SubmitButtonWidth)/2;
    
    // Password *
    
    self.TFPassword = [[UITextField alloc] initWithFrame:CGRectMake(TextfieldXposition, LastPosition, TextfieldWidth, TextfieldHeight)];
    [self.TFPassword customizeWithPlaceholderText:@"Password" andImageOnRightView:nil andLeftBarText:@"*"];
    [self.TFPassword setTag:nextdatatag];
    [self.TFPassword setSecureTextEntry:YES];
    [_MainScrollView addSubview:self.TFPassword];
    
    LastPosition = LastPosition + Difference;
    nextdatatag  = nextdatatag +1;
    // Confirm Password *
    
    self.TFCPassword = [[UITextField alloc] initWithFrame:CGRectMake(TextfieldXposition, LastPosition, TextfieldWidth, TextfieldHeight)];
    [self.TFCPassword customizeWithPlaceholderText:@"Confirm Password" andImageOnRightView:nil andLeftBarText:@"*"];
    [self.TFCPassword setSecureTextEntry:YES];
    [self.TFCPassword setTag:nextdatatag];
    [_MainScrollView addSubview:self.TFCPassword];
    
    LastPosition = LastPosition + Difference;
    nextdatatag  = nextdatatag +1;
    
    _SubmitButton = [[UIButton alloc] initWithFrame:CGRectMake(SubmitButtonxposition ,LastPosition+50, SubmitButtonWidth, SubmitButtonHeight)];
    [_SubmitButton setBackgroundColor:[UIColor colorFromHex:0xe66a4c]];
    [_SubmitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [_SubmitButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0f]];
    [_SubmitButton.layer setCornerRadius:3.0f];
    [_SubmitButton addTarget:self action:@selector(ChangePasswordProcess:) forControlEvents:UIControlEventTouchUpInside];
    [_SubmitButton setTitleColor:[UIColor colorFromHex:0xffffff] forState:UIControlStateNormal];
    [_SubmitButton setTag:104];
    [_MainScrollView addSubview:_SubmitButton];
    
    for(id aSubView in [_MainScrollView subviews])
    {
        if([aSubView isKindOfClass:[UITextField class]])
        {
            UITextField *textField=(UITextField*)aSubView;
            [textField setDelegate:self];
            NSLog(@"UITextField ---- %ld",(long)textField.tag);
        }
    }
}

#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for(id aSubView in [_MainScrollView subviews])
    {
        if([aSubView isKindOfClass:[UITextField class]])
        {
            UITextField *textField=(UITextField*)aSubView;
            [textField resignFirstResponder];
        }
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:1.0f animations:^(void){
        //[_MainScrollView setContentOffset:CGPointMake(0, -20) animated:YES];
    }];
    [textField resignFirstResponder];
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

#pragma Chage Password Action 

-(IBAction)ChangePasswordProcess:(id)sender
{
    NSLog(@"Everything is fine");
    BOOL validate = YES;
    
    if ([_TFPassword.text CleanTextField].length == 0) {
        [self ShowAletviewWIthTitle:@"Sorry" Tag:777 Message:@"Password Please"];
        validate = NO;
    } else if ([_TFCPassword.text CleanTextField].length == 0) {
        [self ShowAletviewWIthTitle:@"Sorry" Tag:777 Message:@"Password Again"];
        validate = NO;
    } else if (![[_TFPassword.text CleanTextField] isEqualToString:[_TFCPassword.text CleanTextField]]) {
        [self ShowAletviewWIthTitle:@"Sorry" Tag:777 Message:@"Password Didn't match"];
        validate = NO;
    }
    
    if (validate) {
        
        for(id aSubView in [_MainScrollView subviews])
        {
            if([aSubView isKindOfClass:[UITextField class]])
            {
                UITextField *textField=(UITextField*)aSubView;
                [textField resignFirstResponder];
            }
        }
        
        self.DataStringArray = [[NSArray alloc] initWithObjects:[_TFPassword.text CleanTextField],[_TFCPassword.text CleanTextField],[self Getlogedinuserid], nil];
        
        [self GetProviderServiceListDetails];
    }
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
        WebserviceProtocol *Datadelegate = [[WebserviceProtocol alloc] initWithParamObject:UrlParameterString.WebParamCustomerChangePassword ValueObject:self.DataStringArray UrlParameter:UrlParameterString.URLParamCustomerChangePassword];
        [Datadelegate setDelegate:self];
    }
}

-(void)RetunWebserviceDataWithSuccess:(WebserviceProtocol *)DataDelegate ObjectCarrier:(NSDictionary *)ParamObjectCarrier
{
    for(id aSubView in [_MainScrollView subviews])
    {
        if([aSubView isKindOfClass:[UITextField class]])
        {
            UITextField *textField=(UITextField*)aSubView;
            [textField setText:nil];
        }
    }
    
    if ([[ParamObjectCarrier objectForKey:@"errorcode"] intValue] == 1) {
        [self ShowAletviewWIthTitle:@"Success" Tag:134 Message:[ParamObjectCarrier objectForKey:@"message"]];
    } else {
        [self ShowAletviewWIthTitle:@"Error" Tag:135 Message:[ParamObjectCarrier objectForKey:@"message"]];
    }
    
    NSLog(@"Success with ParamObjectCarrier -- %@",ParamObjectCarrier);
}
-(void)RetunWebserviceDataWithError:(WebserviceProtocol *)DataDelegate ObjectCarrier:(NSError *)ParamObjectCarrier
{
    for(id aSubView in [_MainScrollView subviews])
    {
        if([aSubView isKindOfClass:[UITextField class]])
        {
            UITextField *textField=(UITextField*)aSubView;
            [textField setText:nil];
            [textField resignFirstResponder];
        }
    }
    
    [self ShowAletviewWIthTitle:@"Error" Tag:135 Message:[NSString stringWithFormat:@"%@",ParamObjectCarrier]];
    NSLog(@"Error with ParamObjectCarrier -- %@",ParamObjectCarrier);
}

-(void)ShowAletviewWIthTitle:(NSString *)ParamTitle Tag:(int)ParamTag Message:(NSString *)ParamMessage
{
    UIAlertView *AlertView = [[UIAlertView alloc] initWithTitle:ParamTitle message:ParamMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [AlertView setTag:ParamTag];
    [AlertView show];
    
}
@end
