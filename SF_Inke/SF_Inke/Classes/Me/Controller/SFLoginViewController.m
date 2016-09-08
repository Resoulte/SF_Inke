
//
//  SFLoginViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/7.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLoginViewController.h"
#import "UMSocial.h"
#import "SFUserHelp.h"
#import "SFTabBarViewController.h"

@interface SFLoginViewController ()

@end

@implementation SFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)weiboLogin:(id)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            
//                        NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
            [SFUserHelp sharedUser].nickName = snsAccount.userName;
            [SFUserHelp sharedUser].iconUrl = snsAccount.iconURL;
            [SFUserHelp saveUser];
            self.view.window.rootViewController = [[SFTabBarViewController alloc] init];
            

        } else {//413354947
            
            NSLog(@"登录失败");
        }
        
    });

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
