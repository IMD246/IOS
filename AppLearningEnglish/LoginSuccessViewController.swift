//
//  LoginSuccessViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/9/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class LoginSuccessViewController: UIViewController {
    var temp:String!
    let a:Int? = 0
    var b:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pass = segue.destination as? UITabBarController else {return}
        let pass1 = pass.viewControllers?.first as! ProfileViewController
        pass1.temp = "self.myOrder"
    }
    
}
