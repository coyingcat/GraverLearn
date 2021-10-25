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



<hr>

<hr>
<hr>

CALayer, 


除了绘制，还有布局 layout


<hr>

<hr>
<hr>



drawRect:


怎样被调用，很重要





<hr>


<hr>


<hr>




修改 Frame / 更新 UI



<hr>


此时，UIView / CALayer,
标记为，待处理