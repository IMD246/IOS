//
//  EditProfileViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var edtAge: UITextField!
    @IBOutlet weak var edtPhone: UITextField!
    
    @IBOutlet weak var btnContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maleBtn.isSelected = false
        femaleBtn.isSelected = false
        
        edtName.delegate = self
        edtAge.delegate = self
        edtPhone.delegate = self
        // Do any additional setup after loading the view.
    }
    //Mark: TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
