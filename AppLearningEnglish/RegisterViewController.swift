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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edtName.delegate = self
        edtAge.delegate = self
        edtUserName.delegate = self
        edtPassword.delegate = self
        edtRepass.delegate = self
        edtPhone.delegate = self
    }
    //Mark: TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hidden the keyboard
        textField.resignFirstResponder();
        return true;
    }
    
    @IBAction func createUser(_ sender: UIButton) {
        let v = Int(edtAge.text ?? "0")
        let user = User(name: edtName.text ?? "", user: edtUserName.text ?? "", gender: gender, age: v ?? 0, phone: edtPhone.text ?? "", point: 0)
        print(user?.getAge())
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
