//
//  ISBlockAlertView.m
//
//  Created by Jimmy on 4/1/12.
//  Copyright (c) 2012 Intsig Information Co., LTD. All rights reserved.
//  github_ios@intsig.com

#import "ISBlockAlertView.h"


@interface ISBlockAlertView () <UIAlertViewDelegate>
{

}
@property (nonatomic) NSInteger customFirstOtherButtonIndex;
@end

@implementation ISBlockAlertView

- (id)  initWithTitle: (NSString*)title 
              message: (NSString *)message
    cancelButtonTitle: (NSString *)cancelButtonTitle 
          cancelBlock: (void (^)(void)) cancelBlock 
    otherButtonTitles: (NSArray*)otherButtonTitles
     otherButtonBlock: (void (^)(NSInteger index)) otherButtonBlock
{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self) {
        _cancelBlock = cancelBlock;
        _otherButtonBlock = otherButtonBlock;
        _customFirstOtherButtonIndex = cancelButtonTitle?1:0;
        for (NSString *title in otherButtonTitles) 
        {
            [self addButtonWithTitle:title];
        }
        
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == self.cancelButtonIndex) 
    {
        if (_cancelBlock)
        {
            _cancelBlock();
        }
    }
    else
    {
        int index = buttonIndex-[(ISBlockAlertView*)alertView customFirstOtherButtonIndex];
        if (_otherButtonBlock)
        {
            _otherButtonBlock(index);
        }
    }
}



@end
