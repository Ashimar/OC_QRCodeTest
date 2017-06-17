//
//  ViewController.m
//  QRCodeTest
//
//  Created by zhenhuaonline on 16/9/1.
//  Copyright © 2016年 Winnie. All rights reserved.
//

#import "ViewController.h"

#import "QRViewController.h"
#import "ShowQRViewController.h"
#import "ShowQR_1_ViewController.h"
#import "QRCodeGenerator.h"

@interface ViewController ()
@property (nonatomic, strong)UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *showQRBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showQRBtn.frame = CGRectMake(120, 100, 100, 30);
    showQRBtn.backgroundColor = [UIColor cyanColor];
    [showQRBtn setTitle:@"查看二维码" forState:0];
    [showQRBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [showQRBtn addTarget:self action:@selector(showQRAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showQRBtn];

    
    UIButton *scanQRBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    scanQRBtn.frame = CGRectMake(120, 160, 100, 30);
    scanQRBtn.backgroundColor = [UIColor blackColor];
    [scanQRBtn setTitle:@"扫一扫" forState:0];
    [scanQRBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [scanQRBtn addTarget:self action:@selector(scanQRAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:scanQRBtn];

    
    UIButton *showQRBtn_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    showQRBtn_1.frame = CGRectMake(120, 220, 150, 30);
    showQRBtn_1.backgroundColor = [UIColor cyanColor];
    [showQRBtn_1 setTitle:@"长按识别二维码" forState:0];
    showQRBtn_1.tag = 1;
    [showQRBtn_1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [showQRBtn_1 addTarget:self action:@selector(showQRAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showQRBtn_1];
}

#pragma mark - 显示二维码
- (void)showQRAction:(UIButton *)sender{
    if (sender.tag == 0) {
        ShowQRViewController *showQRView = [ShowQRViewController new];
        [self.navigationController pushViewController:showQRView animated:YES];
        
    } else {
        ShowQR_1_ViewController* showQRView = [ShowQR_1_ViewController new];
        [self.navigationController pushViewController:showQRView animated:YES];

    }
}
#pragma mark - 扫一扫二维码
- (void)scanQRAction:(UIButton *)sender{
    self.view.backgroundColor = [UIColor yellowColor];
    QRViewController *qrVC = [QRViewController new];
    [self.navigationController pushViewController:qrVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
