//
//  ParentBuilder.swift
//  hoge
//
//  Created by kazuya on 2017/11/23.
//  Copyright © 2017年 hoge. All rights reserved.
//

import UIKit

struct ParentBuilder {
    static func build() -> UIViewController {
        let viewController = UIStoryboard.init(name: "ParentViewController", bundle: nil).instantiateViewController(withIdentifier: "ParentViewController")
        return viewController
    }
}
