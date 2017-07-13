//
//  ViewController.swift
//  News
//
//  Created by CoderJay on 18/04/2017.
//  Copyright © 2017 VanJay. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import EZSwiftExtensions
import HandyJSON

class LobbyViewController: UICollectionViewController {
    fileprivate let cellID = "Cell"
    fileprivate let headerID = "Header"
    fileprivate let footerID = "Footer"

    lazy var dataSources = { () -> [LobbyItemBase] in
        var data = [LobbyItemBase]()
        if let path = Bundle.main.path(forResource: "LobbyItem", ofType: "plist") {
            if let dictArr = NSArray(contentsOfFile: path) as? [NSDictionary] {
                for dictOut in dictArr {
                    let lobbyItemBase = JSONDeserializer<LobbyItemBase>.deserializeFrom(dict: dictOut)
                    data.append(lobbyItemBase!)
                }
            } else {
                print("路径存在，加载失败")
            }
        } else {
            print("路径不存在")
        }
        return data
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UICollectionViewDataSource
extension LobbyViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSources.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let lobbyItemSection = dataSources[section]

        return lobbyItemSection.data!.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCollectionViewCell
        cell.backgroundColor = UIColor.green

        let lobbyItemSection = dataSources[indexPath.section]

        cell.lobbyItem = lobbyItemSection.data?[indexPath.row]

        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var  reusableview = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as! MainCollectionHeaderView
            let lobbyItemBase = dataSources[indexPath.section]
            headerView.titleLabel.text = lobbyItemBase.category
            reusableview = headerView
        } else if kind == UICollectionElementKindSectionFooter {
            let footerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerID, for: indexPath) as! MainCollectionFooterView
            let lobbyItemBase = dataSources[indexPath.section]
            footerview.footerLabel.text = "我是" + lobbyItemBase.category! + "的描述"

            reusableview = footerview
        }
        return reusableview
    }
}

// MARK: - UICollectionViewDelegate
extension LobbyViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MainCollectionViewCell

        cell.backgroundColor = UIColor.random()
        if (cell.lobbyItem.vcName) != nil {
            // 从SB加载
            let sb = UIStoryboard(name: "NewsTableViewController", bundle: Bundle.main)

            let vc = sb.instantiateInitialViewController()!

//            let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
//            let destVcClass = NSClassFromString(nameSpace + "." + vcName) as! UIViewController.Type
//            let vc = destVcClass.init()
//            vc.transitioningDelegate = self as? UIViewControllerTransitioningDelegate

            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
