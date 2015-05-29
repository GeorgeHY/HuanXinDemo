//
//  ViewController.m
//  HuanXinDemo
//
//  Created by iwind on 15/5/25.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import "ViewController.h"
#import "EaseMob.h"
#import "GlobalKeys.h"
#import "ChatViewController.h"
@interface ViewController () <UITextFieldDelegate,IChatManagerDelegate>
@property (nonatomic, strong) UITextField * usernameTF;
@property (nonatomic, strong) UITextField * pwdTF;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];

    self.view.backgroundColor = [UIColor whiteColor];
    //[self registerAction];
    [self createUI];
}

-(void)createUI
{
    //注册按钮
    UIButton * registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 80, 80, 50)];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: registerBtn];
    registerBtn.backgroundColor = [UIColor redColor];
    //登录按钮
    UIButton * loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(registerBtn.frame)+ 20, 80, 80, 50)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget: self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    loginBtn.backgroundColor = [UIColor blueColor];
    //退出
    UIButton * logoffBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(loginBtn.frame) + 20, 80, 80, 50)];
    [logoffBtn setTitle:@"退出" forState:UIControlStateNormal];
    [logoffBtn addTarget: self action:@selector(logoffAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoffBtn];
    logoffBtn.backgroundColor = [UIColor greenColor];
    
    
    //账户名输入
    self.usernameTF = [[UITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(loginBtn.frame)+20,kMainScreenWidth - 40, 50)];
    self.usernameTF.placeholder = @"请输入用户名";
    self.usernameTF.delegate = self;
    [self.view addSubview:self.usernameTF];
    
    //密码输入
    
    self.pwdTF = [[UITextField alloc]initWithFrame:CGRectMake(20,CGRectGetMaxY(self.usernameTF.frame)+20 , kMainScreenWidth- 40, 50)];
    self.pwdTF.placeholder = @"请输入密码";
    self.pwdTF.delegate = self;
    [self.view addSubview:self.pwdTF];
    
    UIButton * pushBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.pwdTF.frame) + 20, kMainScreenWidth - 40, 50)];
    [pushBtn setTitle:@"跳转chatView" forState:UIControlStateNormal];
    pushBtn.backgroundColor = [UIColor yellowColor];
    [pushBtn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
                                                             
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Action
- (void)registerAction
{
//    NSLog(@"注册");
//    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.usernameTF.text password:self.pwdTF.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
//        NSLog(@"error = %@",error.description);
//            if (!error) {
//                NSLog(@"注册成功");
//            }
//        } onQueue:nil];
    
    
    
    

    
    
    
}
- (void)loginAction
{
//    NSLog(@"登录");
//    BOOL isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
//    if (!isAutoLogin) {
//        [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:self.usernameTF.text password:self.pwdTF.text completion:^(NSDictionary *loginInfo, EMError *error) {
//            if (!error && loginInfo) {
//                NSLog(@"登录成功");
//                //设置自动登录
//                [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
//            }
//        } onQueue:nil];
//    }
//    
    
}

- (void)logoffAction
{
//    NSLog(@"退出");
//    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
//        NSLog(@"%@",info);
//        if (!error && info) {
//            NSLog(@"退出成功");
//        }
//    } onQueue:nil];
}

- (void)pushAction
{
    ChatViewController * chatVC = [[ChatViewController alloc]initWithChatter:@"dvbs2" isGroup:NO];
    chatVC.title = @"dvbs2";
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:chatVC];
    [self presentViewController:navi animated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}


#pragma mark - ReceiveMessage
/*!
 @method
 @brief 收到消息时的回调
 @param message      消息对象
 @discussion 当EMConversation对象的enableReceiveMessage属性为YES时, 会触发此回调
 针对有附件的消息, 此时附件还未被下载.
 附件下载过程中的进度回调请参考didFetchingMessageAttachments:progress:,
 下载完所有附件后, 回调didMessageAttachmentsStatusChanged:error:会被触发
 */
- (void)didReceiveMessage:(EMMessage *)message
{
    NSLog(@"message == %@",message);
}

@end
