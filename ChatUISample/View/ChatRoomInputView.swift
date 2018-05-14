//
//  ChatRoomInputView.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/11.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import Foundation
import UIKit

class ChatRoomInputView: UIView {
    
    @IBOutlet weak var inputTextView: RoundedTextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setFromXib()
    }
    
    func setFromXib() {
        let nib = UINib.init(nibName: "ChatRoomInputView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame.size.width = UIScreen.main.bounds.width
        self.addSubview(view)
    }
}
