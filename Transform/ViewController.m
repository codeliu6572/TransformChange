//
//  ViewController.m
//  Transform
//
//  Created by 刘浩浩 on 16/3/15.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    UIImage *image=[UIImage imageNamed:@"green.png"];
    imageView.image=image;
    imageView.center=self.view.center;
    imageView.alpha=0.4;
    [self.view addSubview:imageView];
    
    UIImageView *imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    UIImage *image1=[UIImage imageNamed:@"green.png"];
    imageView1.image=image1;
    imageView1.center=self.view.center;
    [self.view addSubview:imageView1];
    
//    CGAffineTransform transform = CGAffineTransformIdentity; //scale by 50%
//    transform = CGAffineTransformScale(transform, 0.5, 0.5); //rotate by 30 degrees
//    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0); //translate by 200 points
//    transform = CGAffineTransformTranslate(transform, 200, 0);
//    //apply transform to layer
//    imageView1.layer.affineTransform = transform;
    
    //下面是用CGAffineTransformConcat对上面的操作进行了混合变换，位置正确
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.5, 0.5);//scale by 50%
 
    CGAffineTransform transform1 = CGAffineTransformIdentity;
    transform1 = CGAffineTransformRotate(transform1, M_PI / 180.0 * 30.0); //rotate by 30 degrees
    
    CGAffineTransform transform2 = CGAffineTransformIdentity;
    //这里改为100，否则看不到了
    transform2 = CGAffineTransformTranslate(transform2, 100, 0);//translate by 200 points
    CGAffineTransform transform3=CGAffineTransformConcat(transform, transform1);
    //这里transform3和transform2的位置不能写反，否则你会发现位置跑偏了一定要注意先后顺序
    imageView1.layer.affineTransform =CGAffineTransformConcat(transform3, transform2);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
