//
//  ChatEntity.swift
//  ChatUISample
//
//  Created by Tsunemasa Hachiya on 2018/05/11.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import Foundation
import UIKit

public class ChatEntity {
    var text = ""
    var time = ""
    var userType: UserType
    
    public init(text: String, time: String, userType: UserType) {
        self.text = text
        self.time = time
        self.userType = userType
    }
    
    public func isMyChat() -> Bool {
        return userType == .I
    }
}

public enum UserType {
    case I
    case You
}
