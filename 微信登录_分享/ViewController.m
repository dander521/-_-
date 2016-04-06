//
//  ViewController.m
//  微信登录_分享
//
//  Created by myhg on 16/3/22.
//  Copyright © 2016年 zhuming. All rights reserved.
//

#import "ViewController.h"
#import "WXLoginShare.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()<WXLoginShareDelegate>
/**
 *  显示头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
/**
 *  显示昵称
 */
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (nonatomic,strong)WXLoginShare *wXLoginShare;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wXLoginShare  = [WXLoginShare shareInstance];
    self.wXLoginShare.delegate = self;
    
}

/**
 *  微信登录
 *
 *  @param sender sender description
 */
- (IBAction)wxBtnCLick:(UIButton *)sender {
//    [self.wXLoginShare WXLogin];
    
    [self.wXLoginShare WXLoginSuccess:^(NSDictionary *dice) {
        NSLog(@"dice = %@",dice);
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:dice[@"headimgurl"]] placeholderImage:[UIImage imageNamed:@"2"]];
        self.nickNameLabel.text = dice[@"nickname"];
    } fail:^(NSDictionary *dice) {
        NSLog(@"dice = %@",dice);
    }];
    
}
/**
 *  文字分享
 *
 *  @param sender sender description
 */
- (IBAction)shareBtnClick1:(UIButton *)sender {
    [self.wXLoginShare WXSendMessageToWX:WXSceneTimeline];
}
/**
 *  图片分享
 *
 *  @param sender sender description
 */
- (IBAction)shareImageBtnClick:(UIButton *)sender {
    [self.wXLoginShare WXSendImageToWX:WXSceneSession];
}
/**
 *  音乐分享
 *
 *  @param sender sender description
 */
- (IBAction)shareMusicBtnClick:(UIButton *)sender {
    [self.wXLoginShare WXSendMusicToWX:WXSceneFavorite];
}
/**
 *  视频分享
 *
 *  @param sender sender description
 */
- (IBAction)shareVideoBtnClick:(UIButton *)sender {
    [self.wXLoginShare WXSendVideoToWX:WXSceneSession];
}
/**
 *  网页分享
 *
 *  @param sender sender description
 */
- (IBAction)shareWebBtnClick:(UIButton *)sender {
    [self.wXLoginShare WXSendWebToWX:WXSceneSession];
}

#pragma mark - WXLoginShareDelegate
- (void)WXLoginShareLoginSuccess:(NSDictionary *)dice{
//    NSLog(@"dice = %@",dice);
//    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:dice[@"headimgurl"]] placeholderImage:[UIImage imageNamed:@"2"]];
//    self.nickNameLabel.text = dice[@"nickname"];
}

- (void)WXLoginShareLoginFail:(NSDictionary *)dice{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
