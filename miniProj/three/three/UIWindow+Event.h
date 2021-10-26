//
//  UIWindow+Event.h
//  three
//
//  Created by Jz D on 2021/10/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (Event)


- (void)sendEvent:(UIEvent *)event;

@end

NS_ASSUME_NONNULL_END
