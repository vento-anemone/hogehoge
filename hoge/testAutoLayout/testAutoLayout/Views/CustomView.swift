//
//  CustomView.swift
//  testAutoLayout
//
//  Created by kazuya on 2020/02/10.
//  Copyright © 2020年 none. All rights reserved.
//

import UIKit

class group: UIStackView {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
}

class CustomView: UIView {
    @IBOutlet var aaa: [group]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }

    func seteup() {
        var i = 0
        for item in aaa {
            i += 1
            item.label.text = "test \(i)"
            switch i {
            case 1:
                item.imageView.backgroundColor = .red
            case 2:
                item.imageView.backgroundColor = .blue
            case 3:
                item.imageView.backgroundColor = .green
            default:
                item.imageView.backgroundColor = .yellow
            }
        }
    }
}
