//
//  High2ViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/29/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class High2ViewController: UIViewController {

    @IBOutlet weak var rdoA: UIButton!
    @IBOutlet weak var rdoB: UIButton!
    @IBOutlet weak var rdoC: UIButton!
    @IBOutlet weak var rdoD: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblQuestionD: UILabel!
    @IBOutlet weak var lblQuestionC: UILabel!
    @IBOutlet weak var lblQuestionB: UILabel!
    @IBOutlet weak var lblQuestionA: UILabel!
    var answer:[Int] = []
    var check3:[Int] = []
    var check2:[Int] = []
    var question = ListQuestion()
    var moveQuestion:[Question] = []
    var oneChoice = OneChoiceQuestion()
    override func viewDidLoad() {
        super.viewDidLoad()
        if check2[0] == 1
        {
            rdoA.isSelected = true
        }
        else{
            rdoA.isSelected = false
        }
        if check2[1] == 1
        {
            rdoB.isSelected = true
        }
        else{
            rdoB.isSelected = false
        }
        if check2[2] == 1
        {
            rdoC.isSelected = true
        }
        else{
            rdoC.isSelected = false
        }
        if check2[3] == 1
        {
            rdoD.isSelected = true
        }
        else{
            rdoD.isSelected = false
        }
        oneChoice = question.listQuestion[1] as! OneChoiceQuestion
        lblDescription.text = "Question 2: \(oneChoice.description ?? "")"
        lblQuestionA.text = oneChoice.oneChoice[0]
        lblQuestionB.text = oneChoice.oneChoice[1]
        lblQuestionC.text = oneChoice.oneChoice[2]
        lblQuestionD.text = oneChoice.oneChoice[3]
    }
    
    @IBAction func checkRdoA(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.rdoA.isSelected = false
        }else{
            self.rdoA.isSelected = true
            self.rdoB.isSelected = false
            self.rdoC.isSelected = false
            self.rdoD.isSelected = false
            check2[0] = 1
            answer.append(0)
        }
    }
    @IBAction func checkRdoB(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.rdoB.isSelected = false
        }else{
            self.rdoB.isSelected = true
            self.rdoA.isSelected = false
            self.rdoC.isSelected = false
            self.rdoD.isSelected = false
            check2[1] = 1
            answer.append(1)
        }
    }
    @IBAction func checkRdoC(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.rdoC.isSelected = false
        }else{
            self.rdoC.isSelected = true
            self.rdoA.isSelected = false
            self.rdoB.isSelected = false
            self.rdoD.isSelected = false
            check2[2] = 1
            answer.append(2)
        }
    }
    @IBAction func checkRdoD(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.rdoD.isSelected = false
        }else{
            self.rdoD.isSelected = true
            self.rdoA.isSelected = false
            self.rdoB.isSelected = false
            self.rdoC.isSelected = false
            check2[3] = 1
            answer.append(3)
        }
    }
    func checkAnswer(){
        answer.removeAll()
        if rdoA.isSelected == true{
            answer.append(0)
        }
        if rdoB.isSelected == true{
            answer.append(1)
        }
        if rdoC.isSelected == true{
            answer.append(2)
        }
        if rdoD.isSelected == true{
            answer.append(3)
        }
    }
    @IBAction func checkFinish(_ sender: UIButton) {
        let alert = UIAlertController(title: "Message", message: "Do you want to finish ?", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Yes", style: .default, handler:{  action in
            //Write your code here
            let passResult = self.storyboard!.instantiateViewController(withIdentifier: "result") as! ResultViewController
            self.checkAnswer()
            passResult.question.listQuestion.removeAll()
            self.question.listQuestion[1].setQuestionAnswer(questionAnswer: self.answer)
            passResult.question.listQuestion = self.question.listQuestion
            self.present(passResult, animated: false, completion: nil)
        })
        alert.addAction(acceptAction)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        if let button = sender as? UIButton , button === btnRight
        {
            checkAnswer()
            guard let pass2 = segue.destination as? High3ViewController else {return}
            pass2.check3 = check3
            //Truyen du lieu mang question sang basic2
            pass2.question.listQuestion.removeAll()
            question.listQuestion[1].setQuestionAnswer(questionAnswer: answer)
            pass2.question.listQuestion = question.listQuestion
            pass2.check2 = check2
        }
        else if let button = sender as? UIButton , button === btnLeft
        {
            checkAnswer()
            moveQuestion = question.listQuestion
            moveQuestion[1].setQuestionAnswer(questionAnswer: answer)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func unwindHigh3(_ sender:UIStoryboardSegue)
    {
        guard let receive = sender.source as? High3ViewController else {return}
        question.listQuestion.removeAll()
        question.listQuestion = receive.moveQuestion
        check3 = receive.ck
        
    }
}
