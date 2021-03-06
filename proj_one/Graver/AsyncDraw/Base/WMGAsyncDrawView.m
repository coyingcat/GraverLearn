//
//  WMGAsyncDrawView.m
//  Graver-Meituan-Waimai
//
//  Created by yangyang
//
//  Copyright © 2018-present, Beijing Sankuai Online Technology Co.,Ltd (Meituan).  All rights reserved.
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
    

#import "WMGAsyncDrawView.h"
#import "WMGContextAssisant.h"
#import "WMGraverMacroDefine.h"

@interface WMGAsyncDrawView ()
@property (nonatomic, weak) WMGAsyncDrawLayer *drawingLayer;

- (void)_displayLayer:(WMGAsyncDrawLayer *)layer
                 rect:(CGRect)rectToDraw
       drawingStarted:(WMGAsyncDrawCallback)startBlock
      drawingFinished:(WMGAsyncDrawCallback)finishBlock
   drawingInterrupted:(WMGAsyncDrawCallback)interruptBlock;

@end

@implementation WMGAsyncDrawView

#pragma mark - AsyncDraw Disable Control

static BOOL _globalAsyncDrawDisabled = NO;
+ (void)initialize
{
    [super initialize];
    _globalAsyncDrawDisabled = NO;
}

+ (BOOL)globalAsyncDrawingDisabled
{
    return _globalAsyncDrawDisabled;
}

+ (void)setGlobalAsyncDrawingDisable:(BOOL)disable
{
    _globalAsyncDrawDisabled = disable;
}

#pragma mark - View Life Cycle

- (void)dealloc
{
    if (_dispatchDrawQueue)
    {
        _dispatchDrawQueue = NULL;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.drawingPolicy = WMGViewDrawingPolicyAsynchronouslyDrawWhenContentsChanged;
        self.opaque = NO;
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
        self.dispatchPriority = DISPATCH_QUEUE_PRIORITY_DEFAULT;
        
        // make overrides work
        self.drawingPolicy = self.drawingPolicy;
        self.fadeDuration = self.fadeDuration;
        self.contentsChangedAfterLastAsyncDrawing = self.contentsChangedAfterLastAsyncDrawing;
        self.reserveContentsBeforeNextDrawingComplete = self.reserveContentsBeforeNextDrawingComplete;
        
        if ([self.layer isKindOfClass:[WMGAsyncDrawLayer class]])
        {
            _drawingLayer = (WMGAsyncDrawLayer *)self.layer;
        }
    }
    return self;
}

#pragma mark - Override From UIView

+ (Class)layerClass
{
    return [WMGAsyncDrawLayer class];
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    
    // 没有 Window 说明View已经没有显示在界面上，此时应该终止绘制
    if (!self.window){
        [self interruptDrawingWhenPossible];
    }
    else if (!self.layer.contents){
        [self setNeedsDisplay];
    }
}

#pragma mark -

- (NSUInteger)drawingCount
{
    return _drawingLayer.drawingCount;
}




- (dispatch_queue_t)drawQueue
{
    if (self.dispatchDrawQueue)
    {
        return self.dispatchDrawQueue;
    }
    
    return dispatch_get_global_queue(self.dispatchPriority, 0);
}





- (void)setDispatchDrawQueue:(dispatch_queue_t)dispatchDrawQueue
{
    if (_dispatchDrawQueue)
    {
        _dispatchDrawQueue = NULL;
    }
    
    _dispatchDrawQueue = dispatchDrawQueue;
}

- (void)interruptDrawingWhenPossible
{
    [_drawingLayer increaseDrawingCount];
}

- (BOOL)alwaysUsesOffscreenRendering
{
    return YES;
}

- (NSTimeInterval)fadeDuration
{
    return _drawingLayer.fadeDuration;
}

- (void)setFadeDuration:(NSTimeInterval)fadeDuration
{
    _drawingLayer.fadeDuration = fadeDuration;
}

- (WMGViewDrawingPolicy)drawingPolicy
{
    return _drawingLayer.drawingPolicy;
}

- (void)setDrawingPolicy:(WMGViewDrawingPolicy)drawingPolicy
{
    _drawingLayer.drawingPolicy = drawingPolicy;
}

- (BOOL)contentsChangedAfterLastAsyncDrawing
{
    return _drawingLayer.contentsChangedAfterLastAsyncDrawing;
}

- (void)setContentsChangedAfterLastAsyncDrawing:(BOOL)contentsChangedAfterLastAsyncDrawing
{
    _drawingLayer.contentsChangedAfterLastAsyncDrawing = contentsChangedAfterLastAsyncDrawing;
}

- (BOOL)reserveContentsBeforeNextDrawingComplete
{
    return _drawingLayer.reserveContentsBeforeNextDrawingComplete;
}

- (void)setReserveContentsBeforeNextDrawingComplete:(BOOL)reserveContentsBeforeNextDrawingComplete
{
    _drawingLayer.reserveContentsBeforeNextDrawingComplete = reserveContentsBeforeNextDrawingComplete;
}

#pragma mark - Drawing

- (void)redraw
{
    [self displayLayer:self.layer];
}








- (void)setNeedsDisplayAsync
{
    self.contentsChangedAfterLastAsyncDrawing = YES;
    
    
    // 标记，所在视图，需要更新。（ 不会立即更新 ）
    
    // 在下一个重新绘制的 run loop 周期中，进行绘制
    
    [self setNeedsDisplay];
}

// 通过 time profile , 查看代码逻辑








- (void)drawRect:(CGRect)rect
{
    [self drawingWillStartAsynchronously:NO];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (!context) {
        WMGLog(@"may be memory warning");
    }
    
    [self drawInRect:self.bounds withContext:context asynchronously:NO userInfo:[self currentDrawingUserInfo]];
    [self drawingDidFinishAsynchronously:NO success:YES];
}





- (void)setNeedsDisplay
{
    // 第一步的绘制流程，标记更新
    
    [self.layer setNeedsDisplay];
}







- (void)setNeedsDisplayInRect:(CGRect)rect
{
    [self.layer setNeedsDisplayInRect:rect];
}


//  [self setNeedsDisplay];

// 唤起 displayLayer:

// 调用的是

// 他里面的


- (void)displayLayer:(CALayer *)layer{              //  从这个方法，来接管的

    
// displayLayer:
// CALayerDelegate 的方法
    
    if (!layer) return;
    
    NSAssert([layer isKindOfClass:[WMGAsyncDrawLayer class]], @"WMGAsyncDrawingView can only display WMGAsyncDrawLayer");
    
    if (layer != self.layer) return;
    
    [self _displayLayer:(WMGAsyncDrawLayer *)layer rect:self.bounds drawingStarted:^(BOOL drawInBackground) {
        [self drawingWillStartAsynchronously:drawInBackground];
    } drawingFinished:^(BOOL drawInBackground) {
        [self drawingDidFinishAsynchronously:drawInBackground success:YES];
    } drawingInterrupted:^(BOOL drawInBackground) {
        [self drawingDidFinishAsynchronously:drawInBackground success:NO];
    }];
}


//  [self setNeedsDisplay];

// 调用的是

- (void)_displayLayer:(WMGAsyncDrawLayer *)layer
                 rect:(CGRect)rectToDraw
       drawingStarted:(WMGAsyncDrawCallback)startCallback
      drawingFinished:(WMGAsyncDrawCallback)finishCallback
   drawingInterrupted:(WMGAsyncDrawCallback)interruptCallback
{
    BOOL drawInBackground = layer.isAsyncDrawsCurrentContent && ![[self class] globalAsyncDrawingDisabled];
    
    [layer increaseDrawingCount];           //  计数器
    //      是为了，标识当前的绘制任务
    
    
    
    
    
    NSUInteger targetDrawingCount = layer.drawingCount;
    
    NSDictionary *drawingUserInfo = [self currentDrawingUserInfo];
    
    
    
    // 定义绘制任务
    
    
    // 将绘图的压力，从 CPU , 转移到 GPU , hehe
    
    // CPU 的事情，还是 CPU 来干，当然是远离主线程，在异步线程中处理的
    
    void (^drawBlock)(void) = ^{
        
        void (^failedBlock)(void) = ^{
            if (interruptCallback)
            {
                interruptCallback(drawInBackground);
            }
        };
        
        
        // 判断，任务是否取消
        
        
        
        // 通过查看，当前的计数器，和我们目标的计数器，
        // 是否一致
        if (layer.drawingCount != targetDrawingCount)
        {
            
            // 如果不一致，则是进入了，下一个的绘制任务
            
            failedBlock();
            return;
        }
        
        
        
        
        CGSize contextSize = layer.bounds.size;
        BOOL contextSizeValid = contextSize.width >= 1 && contextSize.height >= 1;
        CGContextRef context = NULL;
        BOOL drawingFinished = YES;
        
        if (contextSizeValid) {
            UIGraphicsBeginImageContextWithOptions(contextSize, layer.isOpaque, layer.contentsScale);
            
            context = UIGraphicsGetCurrentContext();
            
            if (!context) {
                WMGLog(@"may be memory warning");
            }
            // 当前调用栈，的保存
            // 保存当前的堆栈信息
            
            
            // 把当前的绘图上下文，放入栈里面
            CGContextSaveGState(context);
            
            if (rectToDraw.origin.x || rectToDraw.origin.y)
            {
                
                
                // 坐标，转换
                CGContextTranslateCTM(context, rectToDraw.origin.x, -rectToDraw.origin.y);
            }
            
            
            
            
            
            if (layer.drawingCount != targetDrawingCount)
            {
                drawingFinished = NO;
            }
            else
            {
                
                // 具体的绘制流程，
                
                // 放在子类，去完成
                
                // 通过继承的方式，实现绘制任务
                
                drawingFinished = [self drawInRect:rectToDraw withContext:context asynchronously:drawInBackground userInfo:drawingUserInfo];
                
                // 父类，没有具体的绘制任务
                // 父类的基本行为， drawingFinished  为  YES
                
                
                // 具体的绘制任务，交给子类, 去重载
            }
            
            CGContextRestoreGState(context);
        }
        
        
        
        // 所有耗时的操作都已完成，但仅在绘制过程中未发生重绘时，将结果显示出来
        if (drawingFinished && targetDrawingCount == layer.drawingCount)
        {
            CGImageRef CGImage = context ? CGBitmapContextCreateImage(context) : NULL;
            
            {
                // 让 UIImage 进行内存管理
                UIImage *image = CGImage ? [UIImage imageWithCGImage:CGImage] : nil;
                
                void (^finishBlock)(void) = ^{
                    
                    // 由于block可能在下一runloop执行，再进行一次检查
                    if (targetDrawingCount != layer.drawingCount)
                    {
                        failedBlock();
                        return;
                    }
                    
                    // 赋值的操作
                    
                    layer.contents = (id)image.CGImage;
                    
                    [layer setContentsChangedAfterLastAsyncDrawing:NO];
                    [layer setReserveContentsBeforeNextDrawingComplete:NO];
                    if (finishCallback){
                        finishCallback(drawInBackground);
                    }
                    
                    
                    // 如果当前是异步绘制，且设置了有效fadeDuration，则执行动画
                    if (drawInBackground && layer.fadeDuration > 0.0001)
                    {
                        layer.opacity = 0.0;
                        
                        [UIView animateWithDuration:layer.fadeDuration delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            layer.opacity = 1.0;
                        } completion:NULL];
                    }
                };      //      void (^finishBlock)(void)
                
                if (drawInBackground)
                {
                    dispatch_async(dispatch_get_main_queue(), finishBlock);
                }
                else
                {
                    finishBlock();
                }
            }
            
            if (CGImage) {
                CGImageRelease(CGImage);
            }
        }
        else
        {
            failedBlock();
        }
        
        UIGraphicsEndImageContext();
    };
    //  void (^drawBlock)(void)
    if (startCallback)
    {
        startCallback(drawInBackground);
    }
    
    if (drawInBackground)
    {
        // 清空 layer 的显示
        if (!layer.reserveContentsBeforeNextDrawingComplete)
        {
            layer.contents = nil;
        }
        // 子线程，绘制 UI 的 layer
        dispatch_async([self drawQueue], drawBlock);
    }
    else
    {
        void (^block)(void) = ^{
            
            // 自定制绘制的时候， 使用
            
            @autoreleasepool {
                
                /*
                            大量的循环，
                    
                            大量的绘制任务，
                 
                            使用 autoreleasepool， 包裹我们的绘制任务
                 
                            对内存，及时的回收
                 
                 
                        */
                
                
                drawBlock();
            }
        };
        
        if ([NSThread isMainThread])
        {
            // 已经在主线程，直接执行绘制
            block();
        }
        else
        {
            // 不应当在其他线程，转到主线程绘制
            dispatch_async(dispatch_get_main_queue(), block);
            
            
        }
    }
}










- (BOOL)respondsToSelector:(SEL)aSelector
{
    if (!self.alwaysUsesOffscreenRendering)
    {
        // 此方法在 -[super initWithFrame:frame] 时检查，因此必须通过重写保证此时的drawingPolicy已设置正确
        if ([NSStringFromSelector(aSelector) isEqual:@"displayLayer:"])
        {
            return self.drawingPolicy != WMGViewDrawingPolicySynchronouslyDraw;
        }
    }
    return [super respondsToSelector:aSelector];
}


#pragma mark - Methods for subclass overriding

- (NSDictionary *)currentDrawingUserInfo
{
    return nil;
}

- (void)drawingWillStartAsynchronously:(BOOL)asynchronously
{
    
}

- (BOOL)drawInRect:(CGRect)rect withContext:(CGContextRef)context asynchronously:(BOOL)asynchronously
{
    return YES;
}

- (BOOL)drawInRect:(CGRect)rect withContext:(CGContextRef)context asynchronously:(BOOL)asynchronously userInfo:(NSDictionary *)userInfo
{
    return [self drawInRect:rect withContext:context asynchronously:asynchronously];
}

- (void)drawingDidFinishAsynchronously:(BOOL)asynchronously success:(BOOL)success
{
    
}

@end
