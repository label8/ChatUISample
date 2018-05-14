//
//  ChatViewController.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/11.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    
    var bottomView: ChatRoomInputView! // 画面下部に表示するテキストフィールドと送信ボタン
    
    var chats: [ChatEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return bottomView // 通常はテキストフィールドのプロパティに設定しますが、画面を表示している間は常に表示したいため、ViewControllerのプロパティに設定します
    }
}

extension ChatViewController {
    func setupUI() {
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        self.view.backgroundColor = UIColor(hex: "8EA6C7")
        chatTableView.backgroundColor = UIColor(hex: "8EA6C7")
        
        chatTableView.separatorColor = UIColor.clear // セルを区切る線を見えなくする
        chatTableView.estimatedRowHeight = 10000 // セルが高さ以上になった場合バインバインという動きをするが、それを防ぐために大きな値を設定
        chatTableView.rowHeight = UITableViewAutomaticDimension // Contentに合わせたセルの高さに設定
        chatTableView.allowsSelection = false // 選択を不可にする
        chatTableView.keyboardDismissMode = .interactive // テーブルビューをキーボードをまたぐように下にスワイプした時にキーボードを閉じる
        
        chatTableView.register(UINib(nibName: "YourChatViewCell", bundle: nil), forCellReuseIdentifier: "YourChat")
        chatTableView.register(UINib(nibName: "MyChatViewCell", bundle: nil), forCellReuseIdentifier: "MyChat")
        
        self.bottomView = ChatRoomInputView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 56.0)) // 下部に表示するテキストフィールドを設定
        self.bottomView.inputTextView.apply(cornerRadius: 5.0, borderWidth: 1, borderColor: UIColor.lightGray)
        
        let chat1 = ChatEntity(text: "text1", time: "10.01", userType: .I)
        let chat2 = ChatEntity(text: "text2", time: "10.02", userType: .You)
        let chat3 = ChatEntity(text: "text3", time: "10.03", userType: .I)
        let chat4 = ChatEntity(text: "text4text4text4text4text4text4text4text4text4text4text4text4text4", time: "10.04", userType: .I)
        let chat5 = ChatEntity(text: "text5text5text5", time: "10.05", userType: .You)
        let chat6 = ChatEntity(text: "text6text6text6text6text6", time: "10.06", userType: .I)
        let chat7 = ChatEntity(text: "text7text7text7text7text7text7", time: "10.07", userType: .You)
        chats = [chat1, chat2, chat3, chat4, chat5, chat6, chat7]
    }
}

extension ChatViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = self.chats[indexPath.row]
        if chat.isMyChat() {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyChat") as! MyChatViewCell
            cell.updateCell(text: chat.text, time: chat.time, isRead: true)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YourChat") as! YourChatViewCell
            cell.clipsToBounds = true
            cell.updateCell(text: chat.text, time: chat.time)
            return cell
        }
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
}








