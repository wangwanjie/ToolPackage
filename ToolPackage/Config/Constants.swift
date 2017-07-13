//
//  Constants.swift
//  News
//
//  Created by CoderJay on 18/04/2017.
//  Copyright © 2017 VanJay. All rights reserved.
//

import Foundation

struct Constants {
    struct NotificationKeys {
        static let Welcome = "kWelcomeNotif"
    }

    struct Paths {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }

    struct News {
        static let url = "http://v.juhe.cn/toutiao/index"
        static let key = "2acadaf7864218e58cae94275d4ba39b"
    }
}
