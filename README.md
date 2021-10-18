# GraverLearn
学习美团的 Graver




<hr>

<hr>
<hr>



WMMutableAttributedItem,  视图绘制单元






WMGMixedView, 用以绘制 item









<hr>

<hr>
<hr>





```

//  [self setNeedsDisplay];

// 调用的是

- (void)_displayLayer:(WMGAsyncDrawLayer *)layer
                 rect:(CGRect)rectToDraw
       drawingStarted:(WMGAsyncDrawCallback)startCallback
      drawingFinished:(WMGAsyncDrawCallback)finishCallback
   drawingInterrupted:(WMGAsyncDrawCallback)interruptCallback
{


```









<hr>

<hr>
<hr>



```

// 子线程，绘制 UI 的 layer
        dispatch_async([self drawQueue], drawBlock);

```