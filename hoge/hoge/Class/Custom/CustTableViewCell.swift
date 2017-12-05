//
//  CustTableViewCell.swift
//  hoge
//
//  Created by kazuya on 2017/12/05.
//  Copyright © 2017年 hoge. All rights reserved.
//

import UIKit

class CustTableViewCell: UITableViewCell {
    @IBOutlet weak var mSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
