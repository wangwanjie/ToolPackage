//
//  NewsTableViewCell.swift
//  ToolPackage
//
//  Created by CoderJay on 2017/7/13.
//  Copyright © 2017年 CoderJay. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    var newsModel: NewsEntityData! {
        willSet {
            newsImageView.kf.setImage(with: URL(string: (newValue?.thumbnailPicS)!), placeholder: UIImage(named: "placeholder"), options: [.cacheOriginalImage], progressBlock: nil, completionHandler: nil)
            titleLabel.text = newValue.title
            infoLabel.text = newValue.authorName! + " - " + newValue.category!

            self.newsModel = newValue
        }
    }

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }

    class func cellWithTableView(_ tableView: UITableView) -> NewsTableViewCell {
        let reuseId = "TableViewCell"

        var cell = tableView.dequeueReusableCell(withIdentifier: reuseId)
        if cell == nil {
            cell = NewsTableViewCell(style: .subtitle, reuseIdentifier: reuseId)
        }
        return cell as! NewsTableViewCell
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
