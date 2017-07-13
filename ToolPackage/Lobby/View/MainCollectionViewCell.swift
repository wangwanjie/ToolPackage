//
//  MainCollectionViewCell.swift
//  News
//
//  Created by CoderJay on 2017/7/7.
//  Copyright © 2017年 VanJay. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class MainCollectionViewCell: UICollectionViewCell {
    public var lobbyItem: LobbyItem! {
        willSet {
            imageView.image = UIImage(named: newValue.imageName!)
            titleLabel.text = newValue.name

            self.lobbyItem = newValue
        }
    }

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        commonInit()
    }

    fileprivate func commonInit() {
//        Thread.callStackSymbols.forEach{print($0)}
        self.imageView.backgroundColor = UIColor.random()
        self.titleLabel.backgroundColor = UIColor.random()
        self.titleLabel.adjustsFontSizeToFitWidth = true
    }
}
