//
//  ConfigViewController.m
//  LimitFreeProject
//
//  Created by baoxu on 15/10/13.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "ConfigViewController.h"
#import "ZTQuickControl.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createUI];
}

-(void)createUI{
    self.title = @"配置页面";
    
    double c = 266.0/255.0;
    
    self.view.backgroundColor = [UIColor colorWithRed:c green:c blue:c alpha:1];
    
    NSArray *images = @[
                        @"account_setting",
                        @"account_favorite",
                        @"account_user",
                        @"account_collect",
                        @"account_download",
                        @"account_comment",
                        @"account_help",
                        @"account_candou"
                        ];
    NSArray *titles = @[
                        @"我的设置",@"我的关注",
                        @"我的账户",@"我的收藏",
                        @"我的下载",@"我的评论",
                        @"我的帮助",@"蚕豆应用",
                        ];
    int inteval = 35;
    
    double w = 57;
    double h = 57;
    double x = 35;
    double y = 64 + 40;
    
    for (int i = 0; i<8; i++) {
        UIButton * button = [self.view addImageButtonWithFrame:CGRectMake(x, y, w, h) title:nil image:images[i] action:^(ZTButton *button) {
            
        }];
        button.tag = i+100;
        
        UILabel *label = [self.view addLabelWithFrame:CGRectMake(x, y+40, w, h) title:titles[i]];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        
//        if (i%3 != 2) {
//            x += (w+inteval);
//            NSLog(@"if——i取模3=%d",i%3);
//        }else{
//            x = 35;
//            y += (h+inteval);
//            NSLog(@"else——i取模3=%d",i%3);
//        }
//        NSLog(@"x:%f,y:%f",x,y);
        
        i%3 != 2 ? (x+=(w+inteval)) : (x=35,y+=(h+inteval));
    }
    
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
