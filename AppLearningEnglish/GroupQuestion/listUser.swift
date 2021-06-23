//
//  listUser.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/13/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import Foundation
import FirebaseDatabase
class listUser {
    var list:[User] = []
    func getDataFromFireBase() {
        list.removeAll();
        let ref = Database.database().reference()
        
        ref.child("users").getData
            {
                (error, snapshot) in
                if let error = error {
                    print("Error getting data \(error)")
                }
                else if snapshot.exists()
                {
                    for i in 0..<snapshot.childrenCount{
                        //                        print(snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "username"))
                        let username = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "username").value as? String
                        let password = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "password").value as? String
                        let gender = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "gender").value as? String
                        let score = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "score").value as? Int
                        let phone = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "phone").value as? String
                        let age = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "age").value as? Int
                        let name = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "name").value as? String
                        let id = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "id").value as? Int
                        let image = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "image").value as? String
                        let users = User(id: id ?? self.list.count+2, name: name ?? "", password: password ?? "", user: username ?? "", gender: gender ?? "", age: age ?? 0, phone: phone ?? "", point: score ?? 0, urlImage: image ?? "")
                        
                        self.list.append(users)
                    }
                    
                }
        }
    }
    func GetTop10(listTemp:[User]) -> [User] {
        var ListRanking:[User] = []
        var max:Int = 0
        for i in 0..<listTemp.count{
            
            if max <= listTemp[i].point{
                max = listTemp[i].point
                
                
            }
        }
        for i in 0..<listTemp.count{
            
            if max >= listTemp[i].point{
                
                ListRanking.append(listTemp[i] )
                
            }
        }
        return ListRanking
    }
    func updateScore(username:String,score:Int) {
        
        let ref = Database.database().reference()
        ref.child("users").getData
            {
                (error, snapshot) in
                if let error = error {
                    print("Error getting data \(error)")
                }
                else if snapshot.exists()
                {
                    
                    for i in 0..<snapshot.childrenCount{
                        
                        if snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "username").value as? String == username
                        {
                            ref.child("users/\(i)").updateChildValues(["score": score]) {
                                (error:Error?, ref:DatabaseReference) in
                                if let error = error {
                                    print("Data could not be saved: \(error).")
                                } else {
                                    print("Data saved successfully!")
                                }
                            }
                        }
                    }
                }
                else{}
                
        }
    }
    
    func updateUserData(username:String,name:String,phone:String,age:Int,gender:String,urlImage:String) {
        let ref = Database.database().reference()
        ref.child("users").getData
            {
                (error, snapshot) in
                if let error = error {
                    print("Error getting data \(error)")
                }
                else if snapshot.exists()
                {
                    for i in 0..<snapshot.childrenCount{
                        
                        if snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "username").value as? String == username
                        {
                            ref.child("users/\(i)").updateChildValues(["name": name,"phone":phone,"age":age,"gender":gender,"image":urlImage]) {
                                (error:Error?, ref:DatabaseReference) in
                                if let error = error {
                                    print("Data could not be saved: \(error).")
                                } else {
                                    print("Data saved successfully!")
                                }
                            }
                        }
                    }
                }
                else{}
                
        }
    }
    func insertUser(user:User) {
        let ref = Database.database().reference()
        ref.child("users").getData
            {
                (error, snapshot) in
                if let error = error {
                    print("Error getting data \(error)")
                }
                else if snapshot.exists()
                {        //hoặc có thể để nó tự tạo id bằng câu lệnh tuy nhiên id tự tạo thuong có hơn 30 chữ cái khó gọi
                    ref.child("users").child("\(snapshot.childrenCount)").setValue(["id":user.id ?? self.list.count+2,
                                                                                    "name" : user.name ,
                                                                                    "password" : user.password,
                                                                                    "username" : user.userName,
                                                                                    "gender" : user.gender,
                                                                                    "age" : user.age,
                                                                                    "phone" : user.phone,
                                                                                    "score":0,
                                                                                    "image":user.urlImage])
                }
                
        }
        //    func getTop10() {
        //        let ref = Database.database().reference()
        //        //hoặc có thể để nó tự tạo id bằng câu lệnh tuy nhiên id tự tạo thuong có hơn 30 chữ cái khó gọi
        //        var rank:[String] = []
        //        var point:[Int] = []
        //        for i in 0<..r
        //
        //    }
        //    func update(user:User) {
        //        let ref = Database.database().reference()
        //        //hoặc có thể để nó tự tạo id bằng câu lệnh tuy nhiên id tự tạo thuong có hơn 30 chữ cái khó gọi
        //        var update = ["name" : user.name , "password" : user.password,"username" : user.userName,"gender" : user.gender,"age" : user.age,"phone" : user.phone] as [String : Any]
        //        ref.updateChildValues(update)
        //    }
        
    }}
