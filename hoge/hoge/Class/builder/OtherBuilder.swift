//
//  OtherBuilder.swift
//  hoge
//
//  Created by hoge on 2017/11/23.
//  Copyright © 2017年 hoge. All rights reserved.
//

import UIKit

struct OtherBuilder {
    static func build() -> UIViewController {
        let viewController = UIStoryboard.init(name: "OtherViewController", bundle: nil).instantiateViewController(withIdentifier: "OtherViewController")
        return viewController
    }
}
