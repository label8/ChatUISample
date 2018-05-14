//
//  MyBalloonView.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/11.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class MyBalloonView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let line = UIBezierPath() // 吹き出しの口部分を描画
        UIColor(hex: "85E249").setFill()
        UIColor.clear.setStroke()
        line.move(to: CGPoint(x: 0, y: 10))
        line.addQuadCurve(to: CGPoint(x: 20, y: 0), controlPoint: CGPoint(x: 10, y: 20))
        line.addQuadCurve(to: CGPoint(x: 5, y: 20), controlPoint: CGPoint(x: 12, y: 30))
        line.close()
        line.fill()
        line.stroke()
    }
}
