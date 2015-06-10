//
//  maskLayerViewController.m
//  POPping
//
//  Created by Czc on 15/6/10.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "maskLayerViewController.h"

@interface maskLayerViewController ()

@end

@implementation maskLayerViewController

//图层的遮罩,比如可以用于圆形的头像等

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加一个iamgeview,
    UIImage * image = [UIImage imageNamed:@"redDot.png"];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 66, 66)];
    imageView.image = image;
    imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageView];
    //为整个imageview添加的mask,通过下面设置masklayer的frame,实现该imageview对象的不同的位置以及大小的遮罩层.
    CALayer * maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(0, 0,50, 50);
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    imageView.layer.mask = maskLayer;
}


@end
