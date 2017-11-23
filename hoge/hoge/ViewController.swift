//
//  ViewController.swift
//  hoge
//
//  Created by hoge on 2017/11/23.
//  Copyright © 2017年 hoge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapNavigation(_ sender: Any) {
        let vc = ParentBuilder.build()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

