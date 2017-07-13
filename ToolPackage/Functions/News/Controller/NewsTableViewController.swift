//
//  NewsTableViewController.swift
//  News
//
//  Created by CoderJay on 2017/7/7.
//  Copyright © 2017年 VanJay. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import HandyJSON
import SwiftyJSON
import Kingfisher

class NewsTableViewController: UITableViewController {

    var dataSources: [NewsEntityData?]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let newsUrl = Constants.News.url + "?type=guoji&key=" + Constants.News.key
         Alamofire.request(newsUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseString { (response) in
            if response.result.isSuccess {
                if let jsonString = response.result.value {
                    let newsEntity = JSONDeserializer<NewsEntity>.deserializeFrom(json: jsonString)
                    if let errorCode = newsEntity?.errorCode, errorCode == 0 {
                        self.dataSources = (newsEntity?.result?.data)!
                        self.tableView.reloadData()
                    } else {
                        return
                    }

                    print(newsEntity?.toJSONString(prettyPrint: true)! ?? "newsEntity为空")
                }
            } else {
                print("失败")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsTableViewController {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        let cell = NewsTableViewCell.cellWithTableView(tableView)

        let newsModel = dataSources?[indexPath.row]

        cell.newsModel = newsModel

//        cell.textLabel?.text = data?.title
//        cell.detailTextLabel?.text = (data?.authorName)! + "-" + (data?.category)!
//        cell.imageView?.kf.setImage(with: URL(string: (data?.thumbnailPicS)!), placeholder: UIImage(named: "placeholder"), options: [.forceRefresh, .forceTransition], progressBlock: nil, completionHandler: nil)

        return cell
    }
}

extension NewsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        let newsModel = cell.newsModel
        let vc = TSWebViewController(title: newsModel?.title, URLString: (newsModel?.url)!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
