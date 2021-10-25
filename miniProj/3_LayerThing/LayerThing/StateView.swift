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
        ctx.textMatrix = CGAffineTransform.identity
        ctx.translateBy(x: 0, y: bounds.size.height)
        ctx.scaleBy(x: 1, y: -1)
        let path = CGMutablePath()
        path.addRect(bounds)
        let raw = "赵客缦胡缨"
        let font = UIFont.systemFont(ofSize: 30)
        let attributedStr = NSAttributedString(string: raw, attributes: [.foregroundColor : UIColor.yellow, .font: font])
        let frameSetter = CTFramesetterCreateWithAttributedString(attributedStr)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        CTFrameDraw(frame, ctx)
    }
    

}



/*
 
 
 
 override func draw(_ rect: CGRect) {
     // Drawing code
     
     guard let ctx = UIGraphicsGetCurrentContext() else { return }
     ctx.textMatrix = CGAffineTransform.identity
     ctx.translateBy(x: 0, y: bounds.size.height)
     ctx.scaleBy(x: 1, y: -1)
     let path = CGPath(rect: bounds, transform: nil)
     let raw = "赵客缦胡缨"
     let font = UIFont.systemFont(ofSize: 30)
     let attributedStr = NSAttributedString(string: raw, attributes: [.foregroundColor : UIColor.yellow, .font: font])
     let frameSetter = CTFramesetterCreateWithAttributedString(attributedStr)
     let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
     CTFrameDraw(frame, ctx)
 }
 
 */
