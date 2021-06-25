//
//  RankTableViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
class RankTableViewController: UITableViewController {
    
    var listData = listUser()
    var listRanking:[User] = []
    var max:Int! = 0
    var listPoint:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let tab = tabBarController?.viewControllers
        guard let pro = tab?[0] as? ProfileViewController else {return}
        listData.list = pro.listUsers.list
        listRanking = listData.GetTop10()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listRanking.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = "RankingTableViewCell"
        // Configure the cell...
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? RankingTableViewCell{
            let user = listRanking[indexPath.row]
            cell.RankName.text = user.name
            cell.RankScore.text = String(user.point)
            cell.RankPosition.text = "Top \(indexPath.row + 1)"
            if(user.urlImage != "")
            {
                let url = URL(string: user.urlImage)
                let data = try? Data(contentsOf: url!)
                if let imageData = data{
                    let image1 = UIImage(data: imageData)
                    cell.RankImage.image = image1
                }
            }
            return cell
        }
        else{
            fatalError("Cell Can not be Created")
        }
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
