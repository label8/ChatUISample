//
//  RoundedTextView.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/15.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class RoundedTextView: UITextView {
    func apply(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
    }
}
