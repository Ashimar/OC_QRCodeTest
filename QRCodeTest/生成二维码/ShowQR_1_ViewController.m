//
//  ShowQR_1_ViewController.m
//  QRCodeTest
//
//  Created by 郑惠珠 on 2017/6/17.
//  Copyright © 2017年 Winnie. All rights reserved.
//

#import "ShowQR_1_ViewController.h"
#import "QRCodeGenerator.h"

#import "CreateQRManager.h"

@interface ShowQR_1_ViewController ()
{
    UIImageView *normalView;
    UILabel *label;
}
@end

@implementation ShowQR_1_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"长按识别二维码";
    
    self.view.backgroundColor = [UIColor whiteColor];
    normalView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 64, 150, 150)];
    [self.view addSubview:normalView];

    
//     normalView.image = [QRCodeGenerator qrImageForString:@"这只是一个测试" imageSize:240];
    
    normalView.image = [CreateQRManager showQRCodeWithDataStr:@"我是二维码" andLogo:@"hh1" logoScaleToSuperView:0.2];
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTouchAction:)];
    normalView.userInteractionEnabled = YES;
    [normalView addGestureRecognizer:longGesture];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 300, 30)];
    [self.view addSubview:label];
}

- (void)longTouchAction:(UIGestureRecognizer *)sender {
    NSString *resultOfQR = [CreateQRManager touchQRImageGetStringWithImage:normalView.image];
    NSLog(@"识别二维码的内容为：%@",resultOfQR);
    label.text = [NSString stringWithFormat:@"识别二维码的内容为：%@",resultOfQR];
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
