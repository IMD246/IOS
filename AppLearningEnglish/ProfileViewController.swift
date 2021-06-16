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
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAge.text = String(users.age)
        lblName.text = users.name
        lblPhone.text = users.phone
        lblGender.text = users.gender
        let url = URL(string: users.urlImage)
        let data = try? Data(contentsOf: url!)
        if let imageData = data{
            let image1 = UIImage(data: imageData)
            image.image = image1
        }
        print(users.urlImage)
        userNameLoginData = users
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func unwindFromResultToProfile(_ sender: UIStoryboardSegue){
        
    }
    @IBAction func unwindComeBackFromEdit(_ sender: UIStoryboardSegue){
        
    }
    
}
