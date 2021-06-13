//
//  ViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/10/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    
    //MARK: properties
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var temp:String = "ab"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.delegate = self
        txtPassword.delegate = self
        // Do any additional setup after loading the view.
    }
    //Mark: TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hidden the keyboard
        textField.resignFirstResponder();
        return true;
    }
    //MARK: LOGIN
    @IBAction func Login(_ sender: UIButton) {
        if temp == "ab"
        {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "loginsuccess") as! LoginSuccessViewController
            vc.temp = "abc"
            present(vc, animated: true, completion: nil)
            
            
           
            print("dang nhap")
        }
    }
    //MARK: UNWIND
    @IBAction func unwindReturn(_ sender:UIStoryboardSegue)
    {
        txtUsername.text = ""
        txtPassword.text = nil
    }
    
}

