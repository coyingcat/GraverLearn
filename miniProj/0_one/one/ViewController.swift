//
//  ViewController.swift
//  one
//
//  Created by Jz D on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var v = CustomView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(v)
    }


    
    
    
    @IBAction func clickBtn(_ sender: UIButton){
        
        
        // hitTest:
        
        // pointInside:
        
        // 找到事件的，最佳响应者
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
    }
    
}





/*
 
 
 
 
 
 触摸屏幕
 
 
 (lldb) bt
 * thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
   * frame #0: 0x000000010034a1d0 one`ViewController.clickBtn(sender=0x0000000100a0b760, self=0x0000000100a0a920) at ViewController.swift:33:5
     frame #1: 0x000000010034a20c one`@objc ViewController.clickBtn(_:) at <compiler-generated>:0
     frame #2: 0x000000018b5ca63c UIKitCore`-[UIApplication sendAction:to:from:forEvent:] + 100
     frame #3: 0x000000018aefc6b4 UIKitCore`-[UIControl sendAction:to:forEvent:] + 208
     frame #4: 0x000000018aefca04 UIKitCore`-[UIControl _sendActionsForEvents:withEvent:] + 352
     frame #5: 0x000000018aefb280 UIKitCore`-[UIControl touchesEnded:withEvent:] + 536
     frame #6: 0x000000018b608500 UIKitCore`-[UIWindow _sendTouchesForEvent:] + 980
     frame #7: 0x000000018b609e20 UIKitCore`-[UIWindow sendEvent:] + 3908
     frame #8: 0x000000018b5e38c0 UIKitCore`-[UIApplication sendEvent:] + 676
     frame #9: 0x000000018b66cd38 UIKitCore`__dispatchPreprocessedEventFromEventQueue + 956
     frame #10: 0x000000018b67174c UIKitCore`__processEventQueue + 6684
     frame #11: 0x000000018b668b4c UIKitCore`__eventFetcherSourceCallback + 160
 
 
 
 
 
 
 
     frame #12: 0x0000000188b4d07c CoreFoundation`__CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 28
     
     捕捉到，当前 source 0 的触摸事件
     
     source 0， 主线程，事件分发
 
 
 
     frame #13: 0x0000000188b4cf78 CoreFoundation`__CFRunLoopDoSource0 + 208
     frame #14: 0x0000000188b4c27c CoreFoundation`__CFRunLoopDoSources0 + 268
     frame #15: 0x0000000188b4625c CoreFoundation`__CFRunLoopRun + 820
     frame #16: 0x0000000188b459f4 CoreFoundation`CFRunLoopRunSpecific + 600
     frame #17: 0x00000001a0216734 GraphicsServices`GSEventRunModal + 164
     frame #18: 0x000000018b5c375c UIKitCore`-[UIApplication _run] + 1072
     frame #19: 0x000000018b5c8fcc UIKitCore`UIApplicationMain + 168
     frame #20: 0x000000019c99824c libswiftUIKit.dylib`UIKit.UIApplicationMain(Swift.Int32, Swift.Optional<Swift.UnsafeMutablePointer<Swift.UnsafeMutablePointer<Swift.Int8>>>, Swift.Optional<Swift.String>, Swift.Optional<Swift.String>) -> Swift.Int32 + 104
     frame #21: 0x000000010034b454 one`static UIApplicationDelegate.main() at <compiler-generated>:0
     frame #22: 0x000000010034b3dc one`static AppDelegate.$main(self=one.AppDelegate) at AppDelegate.swift:10:1
     frame #23: 0x000000010034b4d4 one`main at <compiler-generated>:0
     frame #24: 0x0000000188801cf8 libdyld.dylib`start + 4
 (lldb)
 
 
 
 
 
 
 
 
 
 
 
 
 
 */
