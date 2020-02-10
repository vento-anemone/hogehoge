//
//  ViewController.swift
//  testAutoLayout
//
//  Created by kazuya on 2020/02/10.
//  Copyright © 2020年 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var custom: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        custom.seteup()
    }


}

