//
//  ISBockActionSheet.m
//
//  Created by Jimmy on 4/1/12.
//  Copyright (c) 2012 Intsig Information Co., LTD. All rights reserved.
//  github_ios@intsig.com

#import "ISBlockActionSheet.h"


@interface ISBlockActionSheet () <UIActionSheetDelegate>
{

}
@property (nonatomic) NSInteger customFirstOtherButtonIndex;
@end

@implementation ISBlockActionSheet
@synthesize customFirstOtherButtonIndex;

- (id)          initWithTitle:(NSString *) title 
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(void (^)(void))cancelBLock
       destructiveButtonTitle:(NSString *) destructiveButtonTitle 
             destructiveBlock:(void (^)(void)) destructiveBlock
            otherButtonTitles:(NSArray *) otherButtonTitles
             otherButtonBlock:(void (^)(NSInteger index)) otherButtonBlock;
{
    self = [super init];
    if (self)
    {
        self.customFirstOtherButtonIndex = 0;
        if (destructiveButtonTitle) 
        {
            [self addButtonWithTitle:destructiveButtonTitle];
            self.destructiveButtonIndex = 0;
            self.customFirstOtherButtonIndex++;
        }
        
        for (NSString *title in otherButtonTitles)
        {
            [self addButtonWithTitle:title];
        }
        
        if (cancelButtonTitle)
        {
            [self addButtonWithTitle:cancelButtonTitle];
            self.cancelButtonIndex = self.numberOfButtons - 1;
        }

        _cancelBlock = cancelBLock;
        _destructiveBlock = destructiveBlock;
        _otherButtonBlock = otherButtonBlock;
        self.delegate = self;
        self.title = title;
    }
    return self;
    
}

- (void)actionSheet:(UIActionSheet *) actionSheet clickedButtonAtIndex:(NSInteger) buttonIndex
{
    if (buttonIndex < 0) {
        return;
    }
    if (buttonIndex == self.cancelButtonIndex)
    {
        if (_cancelBlock)
        {
            _cancelBlock();
        }
    }
    else if (buttonIndex == self.destructiveButtonIndex) 
    {
        if (_destructiveBlock)
        {
            _destructiveBlock();
        }
    }
    else
    {
        int index = buttonIndex-[(ISBlockActionSheet*)actionSheet customFirstOtherButtonIndex];
        if (_otherButtonBlock)
        {
            _otherButtonBlock(index);
        }
    }
}

@end
