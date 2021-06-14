//
//  Basic1ViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/29/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class Basic1ViewController: UIViewController {
    
    @IBOutlet weak var radioBtnA: UIButton!
    @IBOutlet weak var radioBtnB: UIButton!
    @IBOutlet weak var radioBtnC: UIButton!
    @IBOutlet weak var radioBtnD: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblQuestionA: UILabel!
    
    @IBOutlet weak var lblQuestionB: UILabel!
    
    @IBOutlet weak var lblQuestionC: UILabel!
    
    @IBOutlet weak var lblQuestionD: UILabel!
    var answer:[Int] = []
    var check1:[Int] = []
    var check2:[Int] = []
    //Tao mang check cau tra loi nguoi dung
    let question = ListQuestion()
    var multi = MultiQuestion()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Khoi tao du lieu cho mang question
        multi = question.listQuestion[0] as! MultiQuestion
        radioBtnA.isSelected = false
        radioBtnB.isSelected = false
        radioBtnC.isSelected = false
        radioBtnD.isSelected = false
        btnLeft.isEnabled = false
        btnLeft.backgroundColor = UIColor.lightGray
        lblDescription.text = "Question 1: \(multi.description ?? "")"
        lblQuestionA.text = multi.multiChoice[0]
        lblQuestionB.text = multi.multiChoice[1]
        lblQuestionC.text = multi.multiChoice[2]
        lblQuestionD.text = multi.multiChoice[3]
    }    
    
    @IBAction func isCheckBtnA(_ sender: UIButton) {
        //self.radioBtnA.isSelected =
        if radioBtnA.isSelected == true{
            radioBtnA.isSelected = false
        }
        else{
            radioBtnA.isSelected = true
            answer.append(0)
        }
        
    }
    @IBAction func isCheckBtnB(_ sender: UIButton) {
        if radioBtnB.isSelected == true{
            radioBtnB.isSelected = false
        }
        else{
            radioBtnB.isSelected = true
            answer.append(1)
        }
    }
    @IBAction func isCheckBtnC(_ sender: UIButton) {
        if radioBtnC.isSelected == true{
            radioBtnC.isSelected = false
        }
        else{
            radioBtnC.isSelected = true
            answer.append(2)
        }
        
    }
    @IBAction func isCheckBtnD(_ sender: UIButton) {
        if radioBtnD.isSelected == true{
            radioBtnD.isSelected = false
        }
        else{
            radioBtnD.isSelected = true
            answer.append(3)
        }
    }
    
    func checkAnswer(){
        answer.removeAll()
        if radioBtnA.isSelected == true{
            answer.append(0)
        }
        if radioBtnB.isSelected == true{
            answer.append(1)
        }
        if radioBtnC.isSelected == true{
            answer.append(2)
        }
        if radioBtnD.isSelected == true{
            answer.append(3)
        }
    }
    
    @IBAction func checkFinish(_ sender: UIButton) {
        let alert = UIAlertController(title: "Message", message: "Do you want to finish ?", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Yes", style: .default, handler:{  action in
            //Write your code here
            let passResult = self.storyboard!.instantiateViewController(withIdentifier: "result") as! ResultViewController
            passResult.question.listQuestion.removeAll()
            self.checkAnswer()
            self.question.listQuestion[0].setQuestionAnswer(questionAnswer: self.answer)
            passResult.question.listQuestion = self.question.listQuestion
            self.present(passResult, animated: false, completion: nil)
        })
        alert.addAction(acceptAction)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let button = sender as? UIButton , button === btnRight
        {
            guard let pass2 = segue.destination as? Basic2ViewController else {return}
            check1.append(0)
            check1.append(0)
            check1.append(0)
            check1.append(0)
            
            check2.append(0)
            check2.append(0)
            check2.append(0)
            check2.append(0)
            //Truyen du lieu mang question sang basic2
            checkAnswer()
            question.listQuestion[0].setQuestionAnswer(questionAnswer: answer)
            pass2.question.listQuestion.removeAll()
            pass2.question.listQuestion = question.listQuestion
            pass2.check2 = check1
            pass2.check3 = check2
            
        }
    }
    @IBAction func unwindBasic2(_ sender:UIStoryboardSegue)
    {
        guard let receive = sender.source as? Basic2ViewController else {return}
        question.listQuestion.removeAll()
        question.listQuestion = receive.moveQuestion
        check1 = receive.check2
        check2 = receive.check3
    }
}
