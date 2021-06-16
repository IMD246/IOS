//
//  ProfileViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
import FirebaseStorage
public var userNameLoginData:User!
class ProfileViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet var image: UIImageView!
    var users:User!
    var temp:String!
    var listUsers:listUser!
    var listUs:[User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAge.text = String(users.age)
        lblName.text = users.name
        lblPhone.text = users.phone
        lblGender.text = users.gender
        if(users.urlImage != "")
        {
            let url = URL(string: users.urlImage)
            let data = try? Data(contentsOf: url!)
            if let imageData = data{
                let image1 = UIImage(data: imageData)
                image.image = image1
            }
        }
        userNameLoginData = users
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
        
    }
    @IBAction func unwindComeBackFromEdit(_ sender: UIStoryboardSegue){
        guard let receive = sender.source as? EditProfileViewController else {return}
        if let id1 = receive.id
        {
            if let age = receive.edtAge.text
            {
                listUs[id1].age = Int(age) ?? users.age
            }
            listUs[id1].name = receive.edtName.text ?? users.name
            listUs[id1].urlImage = receive.urlImage
        }
        lblAge.text = receive.edtAge.text
        lblName.text = receive.edtName.text
        lblPhone.text = receive.edtPhone.text
        lblGender.text = receive.gender
        if(receive.urlImage != "")
        {
            let url = URL(string: receive.urlImage)
            let data = try? Data(contentsOf: url!)
            if let imageData = data{
                let image1 = UIImage(data: imageData)
                image.image = image1
            }
        }
    }
}
