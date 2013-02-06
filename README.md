ISBlockActionSheet-ISBlockAlertView
====================================

When you want to present a alertview or actionsheet in iOS with standard UIKit, you need to configure them, present them in one place and handle the callback somewhere else. And when you have multiple actionSheet or alertView, you have to use some techniques to differentiate each one of them and then handle all of them in one place.

Why not write the callback code right where you create and present them? This a more straightforward workflow and results in much cleaner code.

## Example

```objective-c
	ISBlockActionSheet *actionSheet = [[ISBlockActionSheet alloc]
                                       initWithTitle:@"Title"
                                       cancelButtonTitle:@"Cancel"
                                       cancelBlock:^{
                                           NSLog(@"cancel");
                                       }
                                       destructiveButtonTitle:nil
                                       destructiveBlock:nil
                                       otherButtonTitles:@[@"Int",@"Sig"]
                                       otherButtonBlock:^(NSInteger index) {
                                           if (index == 0) NSLog(@"Int pressed");
                                           if (index == 1) NSLog(@"Sig pressed");
                                       }];
    [actionSheet showInView:self.view];
```

```objective-c
    ISBlockAlertView *alertView = [[ISBlockAlertView alloc]
                                   initWithTitle:@"Title"
                                   message:@"Message"
                                   cancelButtonTitle:@"Cancel"
                                   cancelBlock:^{
                                       NSLog(@"cancel");
                                   }
                                   otherButtonTitles:@[@"Int",@"Sig"]
                                   otherButtonBlock:^(NSInteger index) {
                                       if (index == 0) NSLog(@"Int pressed");
                                       if (index == 1) NSLog(@"Sig pressed");
                                   }];
    [alertView show];
```



## License

The MIT License (MIT)
Copyright (c) <2013> <Intsig Information Co., LTD.>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.