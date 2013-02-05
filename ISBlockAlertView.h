//
//  ISBlockAlertView.h
//
//  Created by Jimmy on 4/1/12.
//  Copyright (c) 2012 Intsig Information Co., LTD. All rights reserved.
//  github_ios@intsig.com

#import <UIKit/UIKit.h>


@interface ISBlockAlertView : UIAlertView
- (id)  initWithTitle: (NSString*)title 
              message: (NSString *)message
    cancelButtonTitle: (NSString *)cancelButtonTitle 
          cancelBlock: (void (^)(void)) cancelBlock 
    otherButtonTitles: (NSArray*)otherButtonTitles           //Array of NSString
     otherButtonBlock: (void (^)(NSInteger index)) otherButtonBlock;   //The parameter is "index" of otherButtonTitles array's objects
    
    ;

@property (nonatomic, strong) void (^cancelBlock)(void);
@property (nonatomic, strong) void (^otherButtonBlock)(NSInteger);

@end
