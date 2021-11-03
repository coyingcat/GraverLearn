//
//  ViewController.m
//  three
//
//  Created by Jz D on 2021/10/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



// run loop 学习

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan: touches withEvent: event];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 子线程的 runloop , 默认没有开启
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"11");
        
        // Run Loop 当中，注册了一个 timer
        // 运行循环，到来的时候，执行这个 timer
        [self performSelector: @selector(haha) withObject: nil afterDelay: 0];
        NSLog(@"33");
    });
    
}




- (void)missionOne{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"11");
        [self performSelector: @selector(haha) withObject: nil afterDelay: 0];
        NSLog(@"33");
    });
}


- (void)haha{
    NSLog(@"22");
}


@end
