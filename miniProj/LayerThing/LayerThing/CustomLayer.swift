//
//  CustomLayer.swift
//  LayerThing
//
//  Created by Jz D on 2021/10/21.
//

import UIKit

protocol CustomLayerDelegate: AnyObject{
    

    func display(custom layer: CALayer)

    func draw(custom layer: CALayer, in ctx: CGContext)

    func layoutSublayersOf(custom layer: CALayer)
    
    func layerWillDrawCustom() -> CGContext?
}







class CustomLayer: CALayer {
    
    
    
    
    
    // 进行图层的绘制
    
    
    override func display() {
        
        // 询问代理 ( UIView ) 来绘制
        
        //  delegate 是 UIView
        if let proxy = delegate as? CustomLayerDelegate, let ctx = proxy.layerWillDrawCustom(){
            
            proxy.draw(custom: self, in: ctx)
            proxy.display(custom: self)
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    // UIView 的  func layoutSubviews()
    
    // 通过 CALayer 的 func layoutSublayers()
    
    // 调用起来
    override func layoutSublayers() {
       // super.layoutSublayers()       // 断点               // bt
        
        if let proxy = delegate as? CustomLayerDelegate{
           
            
            
            
        }
        
        
        
        
    }
    
    
    
    /*
        
     
     上面的方法，断点， bt
     
     
     
     * thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
       * frame #0: 0x0000000102461b34 LayerThing`CustomLayer.layoutSublayers(self=0x0000000283b46260) at CustomLayer.swift:25:5
         frame #1: 0x0000000102461b88 LayerThing`@objc CustomLayer.layoutSublayers() at <compiler-generated>:0
         frame #2: 0x00000001941dddb8 QuartzCore`CA::Layer::layout_if_needed(CA::Transaction*) + 472
         frame #3: 0x00000001941f021c QuartzCore`CA::Layer::layout_and_display_if_needed(CA::Transaction*) + 144
         frame #4: 0x0000000194134e10 QuartzCore`CA::Context::commit_transaction(CA::Transaction*, double) + 304
         frame #5: 0x000000019415f8c4 QuartzCore`CA::Transaction::commit() + 684
         frame #6: 0x00000001916cb770 UIKitCore`__34-[UIApplication _firstCommitBlock]_block_invoke_2 + 84
         frame #7: 0x000000018d506b30 CoreFoundation`__CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 28
         frame #8: 0x000000018d5062a0 CoreFoundation`__CFRunLoopDoBlocks + 268
         frame #9: 0x000000018d501210 CoreFoundation`__CFRunLoopRun + 800
         frame #10: 0x000000018d500bc8 CoreFoundation`CFRunLoopRunSpecific + 480
         frame #11: 0x00000001978e95cc GraphicsServices`GSEventRunModal + 164
         frame #12: 0x00000001916b3744 UIKitCore`UIApplicationMain + 1936
         frame #13: 0x00000001c3f58f58 libswiftUIKit.dylib`UIKit.UIApplicationMain(Swift.Int32, Swift.Optional<Swift.UnsafeMutablePointer<Swift.UnsafeMutablePointer<Swift.Int8>>>, Swift.Optional<Swift.String>, Swift.Optional<Swift.String>) -> Swift.Int32 + 172
         frame #14: 0x0000000102463238 LayerThing`static UIApplicationDelegate.main() at <compiler-generated>:0
         frame #15: 0x00000001024631c0 LayerThing`static AppDelegate.$main(self=LayerThing.AppDelegate) at AppDelegate.swift:10:1
         frame #16: 0x00000001024632b8 LayerThing`main at <compiler-generated>:0
         frame #17: 0x000000018d37d384 libdyld.dylib`start + 4
     
     
     
     
     */
    

}
