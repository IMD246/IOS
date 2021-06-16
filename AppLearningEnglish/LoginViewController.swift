//
//  ViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/10/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
import FirebaseDatabase
class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    //MARK: properties
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var tempuser:String!
    
    var temppassword:String!
    var checkLogin:Bool! = false
    var listData = listUser()
    var count:Int! = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.delegate = self
        txtPassword.delegate = self
        // Do any additional setup after loading the view.
        listData.getDataFromFireBase()
    }
    //Mark: TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hidden the keyboard
        textField.resignFirstResponder();
        return true;
    }
    //MARK: LOGIN
    @IBAction func Login(_ sender: UIButton)
    {
        for i in 0..<listData.list.count
        {
            if txtUsername.text == listData.list[i].userName,txtPassword.text == listData.list[i].password{
                checkLogin = true
                count = i
                break
            }
        }
        
        if self.checkLogin == true{
            let users:User
            users = listData.list[count]
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
            let pass = vc.viewControllers?.first as! ProfileViewController
            pass.users = users
            pass.listUsers = listData
            pass.listUs = listData.list
            present(vc, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Message", message: "Wrong account or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    //MARK: UNWIND
    @IBAction func unwindReturn(_ sender:UIStoryboardSegue)
    {
        txtUsername.text = nil
        txtPassword.text = nil
        checkLogin = false
    }
}
