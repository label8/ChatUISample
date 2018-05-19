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
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var inputTextViewHeightConstraint: NSLayoutConstraint!
    
    var isObserving = false
    
    var chats: [ChatEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面タップを取得
        let screenTap = UITapGestureRecognizer(target: self, action: #selector(ChatViewController.tapGesture(sender:)))
        self.view.addGestureRecognizer(screenTap)
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Viewの表示時にキーボード表示・非表示時を監視していたObserverを解放する
        if(isObserving) {
            let notification = NotificationCenter.default
            notification.removeObserver(self)
            notification.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            notification.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            isObserving = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Viewの表示時にキーボード表示・非表示を監視するObserverを登録する
        if(!isObserving) {
            let notification = NotificationCenter.default
            notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            isObserving = true
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification?) {
        // キーボード表示時の動作をここに記述する
        let rect = (notification?.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration:TimeInterval = notification?.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
        UIView.animate(withDuration: duration, animations: {
            //let transform = CGAffineTransform(translationX: 0, -rect.size.height + 49)
            let transform = CGAffineTransform(translationX: 0, y: -rect.size.height)
            self.view.transform = transform
        }, completion:nil)
    }
    
    @objc func keyboardWillHide(notification: NSNotification?) {
        // キーボード消滅時の動作をここに記述する
        let duration = (notification?.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double)
        UIView.animate(withDuration: duration, animations:{
            self.view.transform = CGAffineTransform.identity
        }, completion:nil)
    }
    
    // 画面がタップされた際にキーボードを閉じる処理
    @objc func tapGesture(sender: UITapGestureRecognizer) {
        self.inputTextView.resignFirstResponder()
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
        
        chatTableView.register(UINib(nibName: "YourChatViewCell", bundle: nil), forCellReuseIdentifier: "YourChat")
        chatTableView.register(UINib(nibName: "MyChatViewCell", bundle: nil), forCellReuseIdentifier: "MyChat")
        
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








