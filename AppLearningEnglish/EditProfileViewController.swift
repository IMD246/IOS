//
//  EditProfileViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

public class EditProfileViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var edtAge: UITextField!
    @IBOutlet weak var edtPhone: UITextField!
    
    @IBOutlet weak var btnContinue: UIButton!
    var gender = ""
    var listData = listUser()
    var nameUser = userNameLoginData.name
    var phoneUser = userNameLoginData.phone
    var ageUser = userNameLoginData.age
    var genderUser = userNameLoginData.gender
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        maleBtn.isSelected = false
        femaleBtn.isSelected = false
        edtName.delegate = self
        edtAge.delegate = self
        edtPhone.delegate = self
        edtName.text = nameUser
        edtAge.text = "\(ageUser)"
        edtPhone.text = phoneUser
        print("\(ageUser)")
        // Do any additional setup after loading the view.
    }
    //Mark: TextFieldDelegate
    @IBAction func finshEditing(_ sender: Any) {
        if maleBtn.isSelected == true {gender = "male"}
        else{gender = "female"}
      
        if edtName.text == nil || edtPhone.text == nil || edtAge.text == nil || gender == ""{
            let alert = UIAlertController(title: "Message", message: "null variable", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            

        listData.updateUserData(username: userNameLoginData.userName, name: edtName.text ?? nameUser, phone: edtPhone.text ?? phoneUser, age: Int(edtAge.text ?? "") ?? ageUser, gender: gender )
            let alert = UIAlertController(title: "Message", message: "success editting", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hidden the keyboard
        textField.resignFirstResponder();
        return true;
    }
    //MARK: Re-Gender
    func isselectionGender(_ isselected:Bool) {
        if isselected{
            self.maleBtn.isSelected = true
            self.femaleBtn.isSelected = false
        }else {
            self.maleBtn.isSelected = false
            self.femaleBtn.isSelected = true
        }
    }
    
    @IBAction func actionCheckedMale(_ sender: UIButton) {
        isselectionGender(true)
    }
    @IBAction func actionCheckedFemale(_ sender: UIButton) {
        isselectionGender(false)
    }
    
    @IBAction func actionDismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
