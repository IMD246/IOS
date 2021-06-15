//
//  RegisterViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var rdbFemale: UIButton!
    @IBOutlet weak var rdbMale: UIButton!
    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var edtAge: UITextField!
    @IBOutlet weak var edtUserName: UITextField!
    @IBOutlet weak var edtPassword: UITextField!
    @IBOutlet weak var edtRepass: UITextField!
    @IBOutlet weak var edtPhone: UITextField!
    
    var gender:String = ""
    var check1:Bool = true
    var check2:Bool = true
    var check3:Bool = true
    var listData = listUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        edtName.delegate = self
        edtAge.delegate = self
        edtUserName.delegate = self
        edtPassword.delegate = self
        edtRepass.delegate = self
        edtPhone.delegate = self
        listData.getDataFromFireBase()
    }
    //Mark: TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hidden the keyboard
        textField.resignFirstResponder();
        return true;
    }
    
    @IBAction func createUser(_ sender: UIButton) {
        let userText:Int = edtUserName.text!.count
        let passwordText:Int = edtPassword.text!.count
        let ageText:Int = Int(edtAge.text!)!
        for i in 0..<listData.list.count
        {
            if edtUserName.text == listData.list[i].userName{
                check1 = false
                break
            }
        }
        let v = Int(edtAge.text ?? "0")
        if edtUserName.text == nil || edtPassword.text == nil || edtAge.text == nil ||  edtName.text == nil || gender == "" {
            let alert = UIAlertController(title: "Message", message: "input invalid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if(edtPassword.text != edtRepass.text){
            let alert = UIAlertController(title: "Message", message: "password not equal to confirm pass", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if userText < 6 {
            let alert = UIAlertController(title: "Message", message: "username length must be equal or bigger than 6", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
        else if passwordText < 6 {
            let alert = UIAlertController(title: "Message", message: "password length must be equal or bigger than 6", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if ageText<0||ageText>99
        {
            let alert = UIAlertController(title: "Message", message: "age not invalid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if check1 == false{
            let alert = UIAlertController(title: "Message", message: "acount user duplicate", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            let user = User(name: edtName.text ?? "",password: edtPassword.text ?? "", user: edtUserName.text ?? "", gender: gender, age: v ?? 0, phone: edtPhone.text ?? "", point: 0)
            let alert = UIAlertController(title: "Message", message: "Register successful", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            listData.insertUser(user: user)
        }
        
    }
    
    //
    func isSelectedGender(_ isSelected: Bool){
        if isSelected{
            self.rdbMale.isSelected = true
            self.rdbFemale.isSelected = false
            gender = "Male"
        } else {
            self.rdbMale.isSelected = false
            self.rdbFemale.isSelected = true
            gender = "Female"
        }
    }

    @IBAction func actionCheckMale(_ sender: UIButton) {
        isSelectedGender(true)
    }
    @IBAction func actionCheckFemale(_ sender: UIButton) {
        isSelectedGender(false)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
