//
//  LobbyItemBase.swift
//  News
//
//  Created by CoderJay on 2017/7/10.
//  Copyright © 2017年 VanJay. All rights reserved.
//

import Foundation
import HandyJSON

struct LobbyItemBase: HandyJSON {
    var desc: String!
    var category: String!
    var data: [LobbyItem]!
}
