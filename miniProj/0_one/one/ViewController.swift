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


}

