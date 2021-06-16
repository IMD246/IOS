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
    var gender = ""
    var listData = listUser()
    var user:User!
    var nameUser:String!
    var phoneUser:String!
    var ageUser:Int!
    var genderUser:String!
    var urlImage:String!
    var id:Int?
    private let storage = Storage.storage().reference()
    override public func viewDidLoad() {
        super.viewDidLoad()
        nameUser = user.name
        phoneUser = user.phone
        ageUser = user.age
        genderUser = user.gender
        urlImage = user.urlImage
        if genderUser == "male"
        {
            maleBtn.isSelected = true
        }
        else
        {
            femaleBtn.isSelected = true
        }
        image.contentMode = .scaleAspectFit
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
            let url = URL(string: urlString) else{
                return
        }
        self.urlImage = urlString
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                let image1 = UIImage(data: data)
                self.image.image = image1
            }
        })
        task.resume()
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
        picker.dismiss(animated: false, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{return}
        guard let imageData = image.pngData() else {return}
        /*
         /Desktop/file.png
         */
        let ref = storage.child("images/file.png")
        ref.putData(imageData,
                    metadata: nil,
                    completion: {_,error in
                        guard error == nil else{
                            print("Failed to upload")
                            return
                        }
                        self.storage.child("images/file.png").downloadURL(completion: {url,error in
                            guard let url = url ,error == nil else{return}
                            let urlString = url.absoluteString
                            DispatchQueue.main.async {
                                self.urlImage = urlString
                                self.image.image = image
                            }
                            print("Download URL: \(urlString)")
                            UserDefaults.standard.set(urlString, forKey: "url")
                        })
        })
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: false, completion: nil)
    }
    //Mark: TextFieldDelegate
    @IBAction func finshEditing(_ sender: Any) {
        if maleBtn.isSelected == true {gender = "male"}
        else{gender = "female"}
      
        if let id = id{
            if edtName.text == nil || edtPhone.text == nil || edtAge.text == nil || gender == ""{
                let alert = UIAlertController(title: "Message", message: "Input Invalid", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else{
                listData.updateUserData(id: id, name: edtName.text ?? nameUser, phone: edtPhone.text ?? phoneUser, age: Int(edtAge.text ?? "") ?? ageUser, gender: gender,urlImage: urlImage)
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
