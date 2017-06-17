//
//  CompurterLoginViewController.h
//  QRShowAndScanDemo
//
//  Created by 郑惠珠 on 2017/5/18.
//  Copyright © 2017年 Ashimar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DISMISSBLOCK) ();

@interface CompurterLoginViewController : UIViewController

@property (nonatomic, strong) NSString *uid;

@property (nonatomic, copy) DISMISSBLOCK dismissBlock;

@end
