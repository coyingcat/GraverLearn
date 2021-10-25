//
//  ViewController.swift
//  LayerThing
//
//  Created by Jz D on 2021/10/21.
//

import UIKit



class ViewController: UIViewController {

    var size: CGSize{
        UIScreen.main.bounds.size
    }
    
    var wid: CGFloat{
        return min(500, size.width - 60)
    }
    
    
    lazy var v = StateView(frame: CGRect(x: (size.width - wid) / 2, y: (size.height - wid) / 2, width: wid, height: wid))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        view.addSubview(v)
        
    }


}

