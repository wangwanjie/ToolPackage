//
//	NewsEntity.swift
//
//	Create by 万杰 王 on 12/7/2017
//	Copyright © 2017. All rights reserved.
//	

import Foundation
import HandyJSON

struct NewsEntity: HandyJSON {

	var errorCode: Int?
	var reason: String?
	var result: NewsEntityResult?

    mutating func mapping(mapper: HelpingMapper) {
        mapper <<<
            self.errorCode <-- "error_code"
        mapper <<<
            self.reason <-- "reason"
        mapper <<<
            self.result <-- "result"
    }
}

struct NewsEntityResult: HandyJSON {

    var data: [NewsEntityData]?
    var stat: String?

    mutating func mapping(mapper: HelpingMapper) {
        mapper <<<
            self.data <-- "data"
        mapper <<<
            self.stat <-- "stat"
    }
}

struct NewsEntityData: HandyJSON {

    var authorName: String?
    var category: String?
    var date: String?
    var thumbnailPicS: String?
    var thumbnailPicS02: String?
    var thumbnailPicS03: String?
    var title: String?
    var uniquekey: String?
    var url: String?

    mutating func mapping(mapper: HelpingMapper) {
        mapper <<<
            self.authorName <-- "author_name"
        mapper <<<
            self.category <-- "category"
        mapper <<<
            self.date <-- "date"
        mapper <<<
            self.thumbnailPicS <-- "thumbnail_pic_s"
        mapper <<<
            self.thumbnailPicS02 <-- "thumbnail_pic_s02"
        mapper <<<
            self.thumbnailPicS03 <-- "thumbnail_pic_s03"
        mapper <<<
            self.title <-- "title"
        mapper <<<
            self.uniquekey <-- "uniquekey"
        mapper <<<
            self.url <-- "url"
    }
}
