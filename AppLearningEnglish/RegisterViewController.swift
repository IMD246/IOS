//
//  RegisterViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/4/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
import FirebaseStorage
class RegisterViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var rdbFemale: UIButton!
    @IBOutlet weak var rdbMale: UIButton!
    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var edtAge: UITextField!
    @IBOutlet weak var edtUserName: UITextField!
    @IBOutlet weak var edtPassword: UITextField!
    @IBOutlet weak var edtRepass: UITextField!
    @IBOutlet weak var edtPhone: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    var gender:String = ""
    var check1:Bool = true
    var listData = listUser()
    var urlimage:String!
    var image: UIImage? = nil
    override func viewDidLoad()
    {
        super.viewDidLoad()        
        imageView.contentMode = .scaleAspectFit
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
            let url = URL(string: urlString) else{
                return
        }
        self.urlimage = urlString
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        })
        task.resume()
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
    @IBAction func didTapButton()
    {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker,animated:false)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            image = imageSelected
            imageView.image = imageSelected
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            image = imageOriginal
            imageView.image = imageOriginal
        }
        picker.dismiss(animated: false, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
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
    @IBAction func createUser(_ sender: UIButton) {
        guard let imageSelected = self.image else {
            let alert = UIAlertController(title: "Message", message: "You have to pick an image", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {return}
        guard let ageText:Int = Int(edtAge.text ?? "0") else {return}
        for i in 0..<listData.list.count
        {
            if edtUserName.text ?? "0" == listData.list[i].userName
            {
                check1 = false
                break
            }
            else
            {
                check1 = true
            }
        }
        if edtUserName.text == nil || edtPassword.text == nil || edtAge.text == nil ||  edtName.text == nil || gender == "" {
            let alert = UIAlertController(title: "Message", message: "Input invalid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if (matches(for:"[A-Z][a-z]{3,}( ?[A-Z][a-z]+)*", in: edtName.text ?? "")==false)
        {
            let alert = UIAlertController(title: "Message", message: "Your name is wrong , It had been liked :Nguyen Thanh Duy", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if (matches(for:"^0[0-9]{9,10}$", in: edtPhone.text ?? "")==false)
        {
            let alert = UIAlertController(title: "Message", message: "Phone has to start 0 and has 10 or 11 lengths", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if (matches(for: edtPassword.text ?? "", in: edtRepass.text ?? "")==false)
        {
            let alert = UIAlertController(title: "Message", message: "password not equal to confirm pass", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if matches(for: "[a-zA-Z0-9]{6,}", in: edtUserName.text ?? "")==false {
            let alert = UIAlertController(title: "Message", message: "username length must be equal or bigger than 6", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
            
        else if matches(for: ".{6,}", in: edtPassword.text ?? "")==false {
            let alert = UIAlertController(title: "Message", message: "password length must be equal or bigger than 6", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if ageText<=0||ageText>99
        {
            let alert = UIAlertController(title: "Message", message: "Age has to start from 1 to 99", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if check1 == false{
            let alert = UIAlertController(title: "Message", message: "Acount user is duplicated", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            let user = User(id: listData.list.count+1, name: edtName.text ?? "",password: edtPassword.text ?? "", user: edtUserName.text ?? "", gender: gender, age: ageText , phone: edtPhone.text ?? "", point: 0,urlImage:urlimage ?? "")
            let alert = UIAlertController(title: "Message", message: "Register successful", preferredStyle: .alert)
           
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.edtAge.text = nil
                self.edtName.text = nil
                self.edtPhone.text = nil
                self.edtPassword.text = nil
                self.edtRepass.text = nil
                self.rdbMale.isSelected = false
                self.rdbMale.isSelected = false
                self.edtUserName.text = nil
            }))
            self.present(alert, animated: true)
            //Mark: insert user
            listData.insertUser(user: user)
            listData.list.append(user)
            //Mark: update image user
            let storageRef = Storage.storage().reference(forURL: "gs://iosproject-771b0.appspot.com")
            let storageProfileRef = storageRef.child("profile\(listData.list.count)").child(user.userName)
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            storageProfileRef.putData(imageData, metadata: metadata) { (storageMetaData, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                storageProfileRef.downloadURL(completion: { (url, error) in
                    if let metaImageURL = url?.absoluteString{
                        self.urlimage = metaImageURL
                        user.setURLImage(urlImage: self.urlimage)
                        self.listData.updateUserData(username: user.userName, name: user.name, phone: user.phone, age: user.age, gender: user.gender, urlImage: user.urlImage)
                    }
                })
            }
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
        guard let pass = segue.destination as? LoginViewController else {return}
        pass.listData.list = listData.list
    }
}
