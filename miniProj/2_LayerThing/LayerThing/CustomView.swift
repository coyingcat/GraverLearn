//
//  CustomView.swift
//  LayerThing
//
//  Created by Jz D on 2021/10/21.
//

import UIKit

class CustomView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        print("-    \(#function)    -")
    }
    

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    
    
    override class var layerClass: AnyClass{
        return CustomLayer.self
    }
}




extension CustomView: CustomLayerDelegate{
    
    // 自定义绘制， 关键方法
    
    
    func display(custom layer: CALayer) {
        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {  return  }
        DispatchQueue.main.async {
            self.layer.contents = img.cgImage
        }
    }
    
    
    func drawing(custom layer: CALayer, in ctx: CGContext) {
        // A
        // draw(bounds.size)
        // 这是一种
        
        //
        //
        //
        
        UIColor.red.set()
        let path = UIBezierPath(rect: CGRect(x: (layer.bb.width - 60)/2, y: (layer.bb.height - 60)/2, width: 60, height: 60))
        ctx.addPath(path.cgPath)
        ctx.fillPath()
        
        
        
    }
    
    
    func layoutSublayersOf(custom layer: CALayer) {
        layoutSubviews()
    }
    
    
    
    
    func layerWillDraw(custom layer: CALayer) -> CGContext? {
        UIGraphicsBeginImageContextWithOptions(layer.bb, layer.isOpaque, layer.contentsScale)
        guard let ctx = UIGraphicsGetCurrentContext() else{ return nil }
        return ctx
    }
    
    
    
    func drawFinished(){
        UIGraphicsEndImageContext()
    }
}

