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
    
    func display(custom layer: CALayer) {
        
    }
    
    
    func draw(custom layer: CALayer, in ctx: CGContext) {
        
        
        
    }
    
    
    func layoutSublayersOf(custom layer: CALayer) {
        layoutSubviews()
    }
    
    
    
    
    
    func layerWillDrawCustom() -> CGContext? {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, layer.isOpaque, layer.contentsScale)
        guard let ctx = UIGraphicsGetCurrentContext() else{ return nil }
        
        
        return ctx
    }
    
}

