//
//  maskView.swift
//  hoge
//
//  Created by kazuya on 2017/11/23.
//  Copyright © 2017年 hoge. All rights reserved.
//

import UIKit

class maskView: UIView {
    @IBOutlet weak var contents: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var marror: UIImageView!
    @IBOutlet weak var mtabView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    func loadNib() {
        let view = Bundle.main.loadNibNamed("maskView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    var contentRadius = 60.0 as CGFloat
    lazy var hollowPoint: CGPoint = {
        return CGPoint(
            x: self.bounds.width / 2.0,
            y: self.bounds.height / 2.0
        )
    }()
    
    lazy var maskLayer: CALayer = {
        // 繰り抜きたいレイヤーを作成する（今回は例として半透明にした）
        let targetLayer = CALayer()
        targetLayer.bounds = self.bounds
        targetLayer.position = CGPoint(
            x: self.bounds.width / 2.0,
            y: self.bounds.height / 2.0
        )
        NSLog("\(targetLayer.frame)")
        targetLayer.backgroundColor = UIColor.black.cgColor
        targetLayer.opacity = 0.5
        
        // 四角いマスクレイヤーを作る
        let mmaskLayer = CAShapeLayer()
        mmaskLayer.bounds = targetLayer.bounds
        
        // 塗りを反転させるために、pathに四角いマスクレイヤーを重ねる
        let ovalRect =  CGRect(
            x: self.mtabView.frame.midX - (self.contentRadius / 2),
            y: self.mtabView.frame.origin.y - 64,
            width: self.contentRadius,
            height: self.contentRadius
        )
        NSLog("\(ovalRect)")
        let path =  UIBezierPath(ovalIn: ovalRect)
        var con = CGRect(x: self.contents.frame.origin.x,
                         y: self.contents.frame.origin.y - 64,
                         width: self.contents.frame.size.width,
                         height: self.contents.frame.size.height)
        
        let arrow =  CGRect(
            x: self.stackView.frame.origin.x + self.mView.frame.origin.x + self.marror.frame.origin.x,
            y: self.stackView.frame.origin.y + self.mView.frame.origin.y + self.marror.frame.origin.y - 64,
            width: self.marror.frame.size.width,
            height: self.marror.frame.size.height
        )
        path.append(UIBezierPath(rect: arrow))
        path.append(UIBezierPath(rect: con))
        path.append(UIBezierPath(rect: mmaskLayer.bounds))
        
        mmaskLayer.path = path.cgPath
        mmaskLayer.position = CGPoint(
            x: targetLayer.bounds.width / 2.0,
            y: targetLayer.bounds.height / 2.0
        )
        NSLog("\(mmaskLayer.position)")
        // マスクのルールをeven/oddに設定する
        mmaskLayer.fillRule = kCAFillRuleEvenOdd
        targetLayer.mask = mmaskLayer
        return targetLayer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
    
    override func layoutSublayers(of layer: CALayer) {
        layer.addSublayer(self.maskLayer)
    }

}
