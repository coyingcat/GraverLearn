//
//  ViewController.swift
//  LayerThing
//
//  Created by Jz D on 2021/10/21.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var v = CustomView(frame: CGRect(x: 150, y: 150, width: 100, height: 100))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        view.addSubview(v)
        
        
    }


}

