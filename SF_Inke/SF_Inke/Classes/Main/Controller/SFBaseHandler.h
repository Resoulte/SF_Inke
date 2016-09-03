//
//  SFBaseHandler.h
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

/**完成block*/
typedef void(^CompleteBlock)();

/**成功block*/
typedef void(^SuccessBlock)(id obj);

/**失败block*/
typedef void(^FailedBlock)(id obj);

@interface SFBaseHandler : NSObject


@end
