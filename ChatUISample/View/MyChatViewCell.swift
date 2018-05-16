//
//  MyChatViewCell.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/11.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class MyChatViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var readLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var textViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myBalloonView: MyBalloonView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.textView.layer.cornerRadius = 15 // 角を丸める
//        let myBalloonView = MyBalloonView(frame: CGRect(x: textView.frame.maxX - 7, y: textView.frame.minY - 10, width: 30, height: 30))
//        addSubview(myBalloonView) // 吹き出しのようにするためにビューを重ねる
        myBalloonView.transform = CGAffineTransform(scaleX: -1, y: 1);
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension MyChatViewCell {
    func updateCell(text: String, time: String, isRead: Bool) {
        self.textView.text = text
        self.timeLabel.text = time
        self.readLabel.isHidden = !isRead
        
        let frame = CGSize(width: self.frame.width - 8, height: CGFloat.greatestFiniteMagnitude)
        var rect = self.textView.sizeThatFits(frame)
        // テキストがMinよりの小さかったら最小のビューの幅を30とする
        if rect.width < 30 {
            rect.width = 30
        // テキストがMaxよりも大きかったら最大のビューの幅を200をとする
        } else if rect.width > 200 {
            rect.width = 200
        }
        textViewWidthConstraint.constant = rect.width // テキストが短くても最小のビューの幅を30とする
    }
}
