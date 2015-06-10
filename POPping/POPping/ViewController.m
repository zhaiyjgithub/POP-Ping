//
//  ViewController.m
//  POPping
//
//  Created by chuck on 15-6-9.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#import "animationObjcet.h"
#import "maskLayerViewController.h"

@interface ViewController () <UINavigationControllerDelegate>
@property(nonatomic,strong)animationObjcet * animaObj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 84, 50, 50)];
    btn.layer.cornerRadius = 25.0;
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:(UIControlEventTouchUpInside)];
    _btn = btn;
    [self.view addSubview:btn];
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 200)];
    image.image = [UIImage imageNamed:@"y2.jpg"];
    [self.view addSubview:image];
    _animaObj = [[animationObjcet alloc] init];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;
}

- (void)clickBtn{
    secondViewController *secondeVC = [[secondViewController alloc] init];
    [self.navigationController pushViewController:secondeVC animated:YES];
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return self.animaObj;
}


//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    maskLayerViewController * maskVC = [[maskLayerViewController alloc] init];
//    [self.navigationController pushViewController:maskVC animated:YES];
//}







@end
