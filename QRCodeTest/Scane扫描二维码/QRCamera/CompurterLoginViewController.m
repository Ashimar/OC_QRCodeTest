//
//  CompurterLoginViewController.m
//  QRShowAndScanDemo
//
//  Created by 郑惠珠 on 2017/5/18.
//  Copyright © 2017年 Ashimar. All rights reserved.
//

#import "CompurterLoginViewController.h"

#define Screen_Height [[UIScreen mainScreen] bounds].size.height
#define Screen_Width [[UIScreen mainScreen] bounds].size.width
#define Screen_Ratio_h Screen_Height/568
#define Screen_Ratio_w Screen_Width/320
#define GREEN_19b8  [UIColor greenColor]
@interface CompurterLoginViewController ()

@end

@implementation CompurterLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawView];
}

- (void)drawView {
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    
    CGFloat x = viewWidth/2-viewWidth/6;
    // 绘制电脑图标
    UIImageView *computerView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 81*Screen_Ratio_h+64, viewWidth/3, 86*Screen_Ratio_h)];
    computerView.image = [UIImage imageNamed:@"QRSource.bundle/compurter"];
    [self.view addSubview:computerView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, computerView.frame.origin.y+computerView.frame.size.height+15, self.view.frame.size.width, 40)];
    textLabel.text = @"厂房在线登录确认";
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:textLabel];
    // 登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(viewWidth/3, viewHeight*3/4, viewWidth/3, 28*Screen_Ratio_h);
    [loginBtn setTitleColor:GREEN_19b8 forState:0];
    [loginBtn setTitle:@"登录" forState:0];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:12*Screen_Ratio_w];
    loginBtn.layer.borderColor = GREEN_19b8.CGColor;
    loginBtn.layer.borderWidth = 0.5;
    loginBtn.layer.cornerRadius = 10*Screen_Ratio_w;
    loginBtn.layer.masksToBounds = YES;
    
    [loginBtn addTarget:self action:@selector(loginButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    // 取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(viewWidth/3, viewHeight*3/4+70, viewWidth/3, 28*Screen_Ratio_h);
    [cancelBtn setTitleColor:[UIColor grayColor] forState:0];
    [cancelBtn setTitle:@"取消" forState:0];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:12*Screen_Ratio_w];
    [cancelBtn addTarget:self action:@selector(cancelButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
    // 返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 30, 44, 44);
    [backBtn setTitleColor:[UIColor grayColor] forState:0];
    [backBtn setTitle:@"返回" forState:0];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:12*Screen_Ratio_w];
    [backBtn addTarget:self action:@selector(backButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

#pragma mark --- 登录按钮 ---
- (void)loginButtonDidTouch:(UIButton *)sender {
    NSLog(@"PC登录");
    
    
    
//    [HTTPREQUEST_SINGLE putDataToServiceWithURL:@"qrcode/" withParams:@{@"type":@(0),@"uid":self.uid} andisToken:YES andisActivity:YES andisEncry:NO success:^(RequestManager *manager, NSDictionary *response) {
    
//        if ([response[@"erro_code"] intValue] != 200) {
    
//            [MBProgressHUD showError:response[@"erro_msg"] ToView:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
//        } else {
//            [self dismissViewControllerAnimated:YES completion:nil];
//            self.dismissBlock();
//        }
//    } failure:^(RequestManager *manager, NSError *error) {
//        [MBProgressHUD showError:HTTPERROR ToView:nil];
//    }];
}


#pragma mark --- 取消按钮 ---
- (void)cancelButtonDidTouch:(UIButton *)sender {
    NSLog(@"取消登录");
//    [HTTPREQUEST_SINGLE deleteRequestWithService:@"qrcode/" andParameters:@{@"type":@(0),@"uid":self.uid} isShowActivity:NO isToken:YES success:^(RequestManager *manager, NSDictionary *response) {
//        if ([response[@"erro_code"] intValue] != 200) {
//            
//            [MBProgressHUD showError:response[@"erro_msg"] ToView:nil];
//            
//            [self dismissViewControllerAnimated:YES completion:nil];
//        } else {
//            
//            [self dismissViewControllerAnimated:YES completion:nil];
//            self.dismissBlock();
//        }
//        [self dismissViewControllerAnimated:YES completion:nil];
//    } failure:^(RequestManager *manager, NSError *error) {
//        [MBProgressHUD showError:HTTPERROR ToView:nil];
////        [self.navigationController popToRootViewControllerAnimated:YES];
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)backButtonDidTouch:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
