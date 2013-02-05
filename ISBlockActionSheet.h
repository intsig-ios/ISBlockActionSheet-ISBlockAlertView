//
//  ISBockActionSheet.h
//
//  Created by Jimmy on 4/1/12.
//  Copyright (c) 2012 Intsig Information Co., LTD. All rights reserved.
//	github_ios@intsig.com

#import <UIKit/UIKit.h>

@interface ISBlockActionSheet : UIActionSheet
- (id)          initWithTitle:(NSString *) title 
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(void (^)(void))cancelBLock
       destructiveButtonTitle:(NSString *) destructiveButtonTitle 
             destructiveBlock:(void (^)(void)) destructiveBlock
            otherButtonTitles:(NSArray *)otherButtonTitles
             otherButtonBlock:(void (^)(NSInteger index))otherButtonBlock;

@property (nonatomic, strong) void (^cancelBlock)(void);
@property (nonatomic, strong) void (^destructiveBlock)(void);
@property (nonatomic, strong) void (^otherButtonBlock)(NSInteger);
@end
