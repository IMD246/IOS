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
        //        list.removeAll();
        let ref = Database.database().reference()
        
        ref.child("users").getData
            {
                (error, snapshot) in
                if let error = error {
                    print("Error getting data \(error)")
                }
                else if snapshot.exists()
                {
                    for i in 0..<Int.max
                    {
                        if(i>snapshot.childrenCount)
                        {
                            break
                        }
                        let username = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "username").value as? String
                        let password = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "password").value as? String
                        let gender = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "gender").value as? String
                        let score = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "score").value as? Int
                        let phone = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "phone").value as? String
                        let age = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "age").value as? Int
                        let name = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "name").value as? String
                        let id = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "id").value as? Int
                        let image = snapshot.childSnapshot(forPath: "\(i)").childSnapshot(forPath: "image").value as? String
                        let users = User(id: id ?? 0, name: name ?? "", password: password ?? "", user: username ?? "", gender: gender ?? "", age: age ?? 0, phone: phone ?? "", point: score ?? 0, urlImage: image ?? "")
                        if users.userName != ""
                        {
                            self.list.append(users)
                        }
                    }
                }
        }
        
    }
    func GetTop10() -> [User] {
        var ListRanking:[User] = []
        list.sort { $0.point > $1.point }
        for i in 0..<10{
            if i<list.count
            {
                ListRanking.append(list[i])
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
                    ref.child("users").child("\(snapshot.childrenCount+1)").setValue(["id":user.id ?? 0,
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
    }}
