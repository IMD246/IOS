//
//  EditProfileViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
import FirebaseStorage

public class EditProfileViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var edtAge: UITextField!
    @IBOutlet weak var edtPhone: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var btnContinue: UIButton!
    var gender:String!
    var listData = listUser()
    var user:User!
    var nameUser:String!
    var phoneUser:String!
    var ageUser:Int!
    var genderUser:String!
    var urlImage:String!
    var id:Int?
    var image1: UIImage? = nil
    private let storage = Storage.storage().reference()
    override public func viewDidLoad() {
        super.viewDidLoad()
        nameUser = user.name
        phoneUser = user.phone
        ageUser = user.age
        genderUser = user.gender
        urlImage = user.urlImage
        if genderUser == "Male"
        {
            maleBtn.isSelected = true
        }
        else
        {
            femaleBtn.isSelected = true
        }
        edtName.delegate = self
        edtAge.delegate = self
        edtPhone.delegate = self
        edtName.text = nameUser
        edtAge.text = String(ageUser)
        edtPhone.text = phoneUser
        if(urlImage != "")
        {
            let url = URL(string: urlImage)
            let data = try? Data(contentsOf: url!)
            if let imageData = data{
                let image1 = UIImage(data: imageData)
                image.image = image1
            }
        }
    }
    //Mark HandleImage
    @IBAction func didTapButton()
    {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker,animated:false)
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            image1 = imageSelected
            image.image = imageSelected
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            image1 = imageOriginal
            image.image = imageOriginal
        }
        picker.dismiss(animated: false, completion: nil)
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: false, completion: nil)
    }
    func matches (for regex:String, in text:String)->Bool
    {
        if text.range(of: regex, options: .regularExpression) != nil
        {
            return true
        }
        return false
    }
    //Mark: TextFieldDelegate
    @IBAction func finshEditing(_ sender: UIButton) {
        guard let imageSelected = self.image1 else {
            return
        }
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {return}
        let storageRef = Storage.storage().reference(forURL: "gs://iosproject-771b0.appspot.com")
        let storageProfileRef = storageRef.child("profile\(user.id ?? 0)").child(user.userName)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        storageProfileRef.putData(imageData, metadata: metadata) { (storageMetaData, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            storageProfileRef.downloadURL(completion: { (url, error) in
                if let metaImageURL = url?.absoluteString{
                    self.user.setURLImage(urlImage: metaImageURL)
                }
            })
        }
        if maleBtn.isSelected == true
        {
            gender = "Male"
        }
        else
        {
            gender = "Female"
        }
        let ageText:Int = Int(edtAge.text!)!
        if user.id != nil{
            if edtName.text == nil || edtPhone.text == nil || edtAge.text == nil || gender == ""{
                let alert = UIAlertController(title: "Message", message: "Input Invalid", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else if (matches(for:"[A-Z][a-z]{3,}( ?[A-Z][a-z]+)*", in: edtName.text ?? "")==false)
            {
                let alert = UIAlertController(title: "Message", message: "Your name is wrong , It had been liked :Nguyen Thanh Duy", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else if ageText<0||ageText>99
            {
                let alert = UIAlertController(title: "Message", message: "age not invalid", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else if (matches(for:"0[0-9]{9,10}", in: edtPhone.text ?? "")==false)
            {
                let alert = UIAlertController(title: "Message", message: "Phone has to start 0 and has 10 or 11 lengths", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else{
                listData.updateUserData(username: user.userName , name: edtName.text ?? nameUser, phone: edtPhone.text ?? phoneUser, age: Int(edtAge.text ?? "20") ?? ageUser, gender: gender,urlImage: user.urlImage)
                let alert = UIAlertController(title: "Message", message: "success editting", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
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
            gender = "Male"
        }else {
            self.maleBtn.isSelected = false
            self.femaleBtn.isSelected = true
            gender = "Female"
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
