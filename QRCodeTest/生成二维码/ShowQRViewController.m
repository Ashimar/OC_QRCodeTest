//
//  ShowQRViewController.m
//  QRCodeTest
//
//  Created by 郑惠珠 on 2017/6/17.
//  Copyright © 2017年 Winnie. All rights reserved.
//

#import "ShowQRViewController.h"

#import "CreateQRManager.h"

@interface ShowQRViewController ()
{
    UIView *borderView;
}
@end

@implementation ShowQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"生成二维码";
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    // ======  普通二维码 可以增加logo
    UIImageView *normalView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 64, 150, 150)];
    [self.view addSubview:normalView];
    
    normalView.image = [CreateQRManager showQRCodeWithImageWidth:200 andDataStr:@"haha,很好玩的样子"];
    [self qrAddLogoImage:normalView];
    
    // ======== 添加一个按钮
    UIButton *addTagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addTagBtn.frame = CGRectMake(200, 100, 90, 30);
    addTagBtn.backgroundColor = [UIColor purpleColor];
    [addTagBtn setTitle:@"添加logo" forState:0];
    [addTagBtn setTitle:@"去掉logo" forState:UIControlStateSelected];
    
    [addTagBtn addTarget:self action:@selector(addTagButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addTagBtn];
    
    
    // ======== 带 logo的二维码
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 250, 150, 150)];
    [self.view addSubview:logoView];
    
    logoView.image = [CreateQRManager showQRCodeWithDataStr:@"我是内部绘制logo的二维码" andLogo:@"hh1.jpg" logoScaleToSuperView:0.2];
    
    // ======== 带 logo的二维码
    UIImageView *colorView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 440, 150, 150)];
    [self.view addSubview:colorView];
    
    colorView.image = [CreateQRManager showQRWithColorQRCodeData:@"我是一张彩色的二维码" backgroundColor:[CIColor colorWithRed:1 green:0 blue:0.8] mainColor:[CIColor colorWithRed:1 green:0.8 blue:0.8]];

}

- (void)addTagButtonAction:(UIButton *)sender {
    borderView.hidden = !borderView.hidden;
}

- (void)qrAddLogoImage:(UIImageView *)imageView {
    CGFloat scale = 0.22;
    CGFloat borderW = 2;
    borderView = [[UIView alloc] init];
    borderView.hidden = YES;
    CGFloat borderViewW = imageView.frame.size.width * scale;
    CGFloat borderViewH = imageView.frame.size.height * scale;
    CGFloat borderViewX = 0.5 * (imageView.frame.size.width - borderViewW);
    CGFloat borderViewY = 0.5 * (imageView.frame.size.height - borderViewH);
    borderView.frame = CGRectMake(borderViewX, borderViewY, borderViewW, borderViewH);
    borderView.layer.borderWidth = borderW;
    borderView.layer.borderColor = [UIColor whiteColor].CGColor;
    borderView.layer.cornerRadius = 5;
    borderView.layer.masksToBounds = YES;
    // 通过 contents 添加图片
    borderView.layer.contents = (id)[UIImage imageNamed:@"hh1.jpg"].CGImage;
    [imageView addSubview:borderView];
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
