//
//  User.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/10/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
public class User {
    var id:Int?
    var name:String = ""
    var userName:String = ""
    var gender:String = ""
    var age:Int = 0
    var phone:String = ""
    var password:String = ""
    var point:Int = 0
    var urlImage:String = ""
    
    //Constructor
    func getName()->String{
        return self.name
    }
    func getUserName()->String{
        return self.userName
    }
    func getPassword()->String{
        return self.password
    }
    func setPassword(password:String){
        self.password = password
    }
    func getGender()->String{
        return gender
    }
    func setURLImage(urlImage:String){
        self.urlImage = urlImage
    }
    func getImage()->String{
        return urlImage
    }
    func getAge()->Int{
        return self.age
    }
    func getPhone()->String{
        return self.phone
    }
    func getPoint()->Int{
        return self.point
    }
    func setName(name:String){
        self.name = name
    }
    func setUsername(userName:String){
        self.userName = userName
    }
    func setGender(gender:String){
        self.gender = gender
    }
    func setAge(age:Int){
        self.age = age
    }
    func setPhone(phone:String){
        self.phone = phone
    }
    func setPoint(point:Int){
        self.point = point
    }
    init(id:Int,name:String,password:String, user:String, gender:String, age:Int, phone:String, point:Int,urlImage:String) {
        if name == "" || user == "" || password == "" || gender == "" || age <= 0 ||
            phone == "" || point < 0{
            print("Data invalid")
        }
        else{
            self.id = id
            self.password = password
            self.name = name
            self.userName = user
            self.gender = gender
            self.age = age
            self.phone = phone
            self.point = point
            self.urlImage = urlImage
        }
    }
}
