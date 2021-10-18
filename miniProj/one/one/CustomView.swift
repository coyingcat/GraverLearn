//
//  CustomView.swift
//  one
//
//  Created by Jz D on 2021/10/18.
//

import UIKit

class CustomView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print(" 哈哈哈 ")
        
    }
    
    
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        
        print(" ha  ha  ha ")
      //  super.draw(layer, in: ctx)
        // 这样才会跑
        // func draw(_ rect: CGRect)
    }
     
     

}
