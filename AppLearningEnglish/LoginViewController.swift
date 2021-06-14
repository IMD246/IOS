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
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var temp:String = "ab"
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
        for i in 0..<listData.list.count{
            if txtUsername.text == listData.list[i].userName,txtPassword.text == listData.list[i].password{
                checkLogin = true
                count = i
                break
            }
        }
        
        if self.checkLogin == true{
            listData.updateScore(username: txtUsername.text ?? "",score: 11)
            let users:User
            users = listData.list[count]
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "loginsuccess") as! LoginSuccessViewController
            vc.users = users
            present(vc, animated: true, completion: nil)
            
        }
        else{print("")}
        
    }
    
    
    //        if temp == "ab"
    //        {
    //            let vc = self.storyboard!.instantiateViewController(withIdentifier: "loginsuccess") as! LoginSuccessViewController
    //            vc.temp = "abc"
    //            present(vc, animated: true, completion: nil)
    //
    //
    //
    //            print("dang nhap")
    //        }
    
    //MARK: UNWIND
    @IBAction func unwindReturn(_ sender:UIStoryboardSegue)
    {
        txtUsername.text = ""
        txtPassword.text = nil
    }
    
}



