//
//  YourChatViewCell.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/12.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class YourChatViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var textViewWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.textView.layer.cornerRadius = 15 // 角を丸める
//        let yourBalloonView = YourBalloonView(frame: CGRect(x: textView.frame.minX - 10, y: textView.frame.minY - 10, width: 50, height: 50))
//        self.addSubview(yourBalloonView) // 吹き出しのようにするためにビューを重ねる
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension YourChatViewCell {
    func updateCell(text: String, time: String) {
        self.textView?.text = text
        self.timeLabel?.text = time
        
        let frame = CGSize(width: self.frame.width, height: CGFloat.greatestFiniteMagnitude)
        var rect = self.textView.sizeThatFits(frame)
        // テキストがMinよりの小さかったら最小のビューの幅を30とする
        if rect.width < 30 {
            rect.width = 30
        // テキストがMaxよりも大きかったら最大のビューの幅を200をとする
        } else if rect.width > 200 {
            rect.width = 200
        }
        textViewWidthConstraint.constant = rect.width
    }
}
