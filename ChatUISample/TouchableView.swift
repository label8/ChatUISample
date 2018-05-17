//
//  TouchableView.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/17.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import Foundation
import UIKit

class TouchableScrollView: UIScrollView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.touchesBegan(touches, with: event)
    }
}

class TouchableTableView: UITableView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.touchesBegan(touches, with: event)
    }
}
