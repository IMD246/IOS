//
//  ForgotPassViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/12/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var radioSMSBtn: UIButton!
    
    @IBOutlet weak var radioemailBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func isselectionRadiobutton(_ isselected:Bool) {
        if isselected{
            self.radioSMSBtn.isSelected = true
            self.radioemailBtn.isSelected = false
        }else {
            self.radioSMSBtn.isSelected = false
            self.radioemailBtn.isSelected = true
        }
    }

    @IBAction func raidoSMSbtnAction(_ sender: UIButton) {
        isselectionRadiobutton(true)
    }
    
    @IBAction func radioemailbtnAction(_ sender: UIButton) {
        isselectionRadiobutton(false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
