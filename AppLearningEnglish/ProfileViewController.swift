//
//  ProfileViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
import FirebaseStorage
public var localUser:User!
class ProfileViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet var imageUser: UIImageView!
    var users:User!
    var urlImage:String!
    var listUsers:listUser! = listUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageUser.layer.cornerRadius = (imageUser.frame.size.width / 2) - 2
        imageUser.clipsToBounds = true
        imageUser.layer.borderColor = UIColor.lightGray.cgColor
        imageUser.layer
        .borderWidth = 1
        lblAge.text = String(users.age)
        lblName.text = users.name
        lblPhone.text = users.phone
        lblGender.text = users.gender
        urlImage = users.urlImage
        if(users.urlImage != "")
        {
            let url = URL(string: users.urlImage)!
            let data = try? Data(contentsOf: url,options: .alwaysMapped)
            print(url)
            if let imageData = data{
                let image1 = UIImage(data: imageData)
                imageUser.image = image1
            }
        }
        localUser = users
    }
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pass = segue.destination as? EditProfileViewController else {return}
            pass.user = users
        if let id = users.id{
              pass.id = id
        }
     }
 
    @IBAction func unwindFromResultToProfile(_ sender: UIStoryboardSegue){
        guard let receive = sender.source as? ResultViewController else {return}
        users = receive.user
        if users.point <= receive.total
        {
            for i in 0..<listUsers.list.count
            {
                if listUsers.list[i].userName == users.userName
                {
                    listUsers.list[i].point = users.point
                    break
                }
            }
        }
        let tab = tabBarController?.viewControllers
        guard let pro = tab?[2] as? RankTableViewController else {return}
        pro.listData.list = listUsers.list
        pro.listRanking = pro.listData.GetTop10()
    }
    @IBAction func unwindComeBackFromEdit(_ sender: UIStoryboardSegue){
        guard let receive = sender.source as? EditProfileViewController else {return}
        for i in 0..<listUsers.list.count
        {
            if listUsers.list[i].userName == receive.user.userName
            {
                
                listUsers.list[i].age = Int(receive.edtAge.text ?? "1") ?? 1
                listUsers.list[i].name = receive.edtName.text ?? ""
                listUsers.list[i].phone = receive.edtPhone.text ?? ""
                listUsers.list[i].urlImage = receive.urlImage
                users = listUsers.list[i]
                break
            }
        }
        lblAge.text = receive.edtAge.text
        lblName.text = receive.edtName.text
        lblPhone.text = receive.edtPhone.text
        lblGender.text = receive.gender
        if(receive.urlImage != "")
        {
            guard let url = URL(string: receive.urlImage) else { return }
            let data = try? Data(contentsOf: url)
            if let imageData = data{
                let image1 = UIImage(data: imageData)
                imageUser.image = image1
            }
        }
        let tab = tabBarController?.viewControllers
        guard let pro = tab?[2] as? RankTableViewController else {return}
        pro.listData.list = listUsers.list
    }
}
