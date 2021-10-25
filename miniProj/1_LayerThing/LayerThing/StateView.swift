//
//  StateView.swift
//  LayerThing
//
//  Created by Jz D on 2021/10/21.
//

import UIKit

class StateView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        UIColor.red.setStroke()
        
        //
        
        //
        ctx.saveGState()
        
        ctx.addEllipse(in: CGRect(x: 140, y: 170, width: 50, height: 50))
        ctx.setLineWidth(3)
        UIColor.purple.setStroke()
        ctx.strokePath()
        
        
        //
        //
        ctx.restoreGState()
        
        ctx.addEllipse(in: CGRect(x: 140, y: 300, width: 50, height: 50))
        ctx.setLineWidth(3)
        
        ctx.strokePath()
        
        
        
        
    }
    

}
