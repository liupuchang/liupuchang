//
//  ViewController.m
//  本地通知Demo
//
//  Created by 任前辈 on 16/2/23.
//  Copyright © 2016年 SingleProgrammers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建测试按钮
    UIButton * sendLocation = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [sendLocation setTitle:@"发送通知" forState:UIControlStateNormal];
    
    [sendLocation addTarget: self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    sendLocation.frame = CGRectMake(100, 100, 100, 50);
    
    [self.view addSubview:sendLocation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)clickButton:(UIButton *)button{
    
    //修改应用 icon的未读数
    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;
    
    
    //创建一个本地通知
    UILocalNotification * localN = [[UILocalNotification alloc] init];
    localN.alertTitle = @"您的macBook到了"; //通知的标题
    localN.alertBody =  @"不知道说什么了,主体内容";
//    localN.alertLaunchImage = @"只能是启动图的图片"
    localN.soundName = @"bullet.mp3";//通知的提示音
    
    localN.applicationIconBadgeNumber = 5;//该通知的将要修改icon的消息数
    
    localN.userInfo = @{@"state":@"1"}; //添加附加信息
    
    //设置什么时候提示
    localN.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localN];//使通知有效  开始计时
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
