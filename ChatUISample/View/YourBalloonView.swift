//
//  YourBalloonView.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/12.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class YourBalloonView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        let line = UIBezierPath() // 吹き出しの口部分を描画
        UIColor.white.setFill()
        UIColor.clear.setStroke()
//        line.move(to: CGPoint(x: 20, y: 15))
//        line.addQuadCurve(to: CGPoint(x: 5, y: 5), controlPoint: CGPoint(x: 5, y: 10))
//        line.addQuadCurve(to: CGPoint(x: 10, y: 25), controlPoint: CGPoint(x: 0, y: 10))
        
//        line.move(to: CGPoint(x: 0, y: 0))
//        line.addQuadCurve(to: CGPoint(x: 100, y: 90), controlPoint: CGPoint(x: 20, y: 90))
//        line.addQuadCurve(to: CGPoint(x: 110, y: 20), controlPoint: CGPoint(x: 140, y: 60))
//        line.addQuadCurve(to: CGPoint(x: 0, y: 0), controlPoint: CGPoint(x: 50, y: 50))

        line.move(to: CGPoint(x: 0, y: 0))
        line.addQuadCurve(to: CGPoint(x: 15, y: 15), controlPoint: CGPoint(x: 5, y: 15))
        line.addQuadCurve(to: CGPoint(x: 20, y: 5), controlPoint: CGPoint(x: 25, y: 10))
        line.addQuadCurve(to: CGPoint(x: 0, y: 0), controlPoint: CGPoint(x: 5, y: 10))

        line.close()
        line.fill()
        line.stroke()
    }
}
