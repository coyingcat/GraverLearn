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
    
    
    lazy var v = CustomView(frame: CGRect(x: 150, y: 150, width: 100, height: 100))
    
    
    lazy var second = StateView(frame: CGRect(x: (size.width - 500) / 2, y: (size.height - 500) / 2, width: 500, height: 500))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        view.addSubview(v)
        
        view.addSubview(second)
        
    }


}

