//
//  ViewController.m
//  ObjC_Localization
//
//  Created by wen-chi Chang on 2018/7/24.
//  Copyright © 2018年 wen-chi Chang. All rights reserved.
//

#import "ViewController.h"
#import "LanguageTool.h"

@interface ViewController ()
{
    UILabel *msgLabel;
    UILabel *helloLabel;
    UIButton *switchButton;
    UIImageView *imgView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    msgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 50)];
    msgLabel.center = self.view.center;
    msgLabel.textAlignment = NSTextAlignmentCenter;
    msgLabel.backgroundColor = [UIColor lightGrayColor];
    [msgLabel setText:GetStringWithKeyFromTable(@"VC_MESSAGE", @"Localizable")];
    [self.view addSubview:msgLabel];
    
    helloLabel = [[UILabel alloc]initWithFrame:CGRectMake(msgLabel.center.x-125, msgLabel.frame.origin.y-60, 250, 50)];
    helloLabel.textAlignment = NSTextAlignmentCenter;
    helloLabel.backgroundColor = [UIColor lightGrayColor];
    [helloLabel setText:GetStringWithKeyFromTable(@"VC_HELLO", @"Localizable")];
    [self.view addSubview:helloLabel];
    
    CGFloat maxY= CGRectGetMaxY(msgLabel.frame);
    switchButton = [[UIButton alloc]initWithFrame:CGRectMake(msgLabel.center.x-100, maxY+50, 200, 50)];
    switchButton.backgroundColor = [UIColor darkGrayColor];
    [switchButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [switchButton setTitle:GetStringWithKey(@"VC_SWITCH") forState:UIControlStateNormal];
    [self.view addSubview:switchButton];
    
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(msgLabel.frame.origin.x, msgLabel.frame.origin.y-250, 250, 150)];
    imgView.backgroundColor = [UIColor blackColor];
    imgView.image = [UIImage imageNamed:@"flag"];

    [self.view addSubview:imgView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)click:(id)sender
{

    [[LanguageTool sharedInstance] changeNowLanguage];
    [[LanguageTool sharedInstance] resetRootViewController];
    
}

@end
