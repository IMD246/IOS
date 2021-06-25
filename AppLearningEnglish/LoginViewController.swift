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
        listData.getDataFromFireBase()
        txtUsername.delegate = self
        txtPassword.delegate = self
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
        print(listData.list.count)
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
            pass.listUsers.list = listData.list
            present(vc, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Message", message: "Wrong account or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    //Mark:Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let pass = segue.destination as? RegisterViewController else {return}
        pass.listData.list = listData.list
    }
    //MARK: UNWIND
    @IBAction func unwindReturn(_ sender:UIStoryboardSegue)
    {       
        txtUsername.text = nil
        txtPassword.text = nil
        checkLogin = false
    }
}
