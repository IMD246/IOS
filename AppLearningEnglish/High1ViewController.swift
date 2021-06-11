//
//  High1ViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/29/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class High1ViewController: UIViewController {
    
    @IBOutlet weak var lblQuestionD: UILabel!
    @IBOutlet weak var lblQuestionC: UILabel!
    @IBOutlet weak var lblQuestionB: UILabel!
    @IBOutlet weak var lblQuestionA: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var correctARadioBtn: UIButton!
    @IBOutlet weak var correctBRadioBtn: UIButton!
    @IBOutlet weak var correctCRadioBtn: UIButton!
    @IBOutlet weak var correctDRadioBtn: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    var answer:[Int] = []
    let question = ListQuestion()
    var multi = MultiQuestion()
    var check1:[Int] = []
    var check2:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        multi = question.listQuestion[0] as! MultiQuestion
        self.correctARadioBtn.isSelected = false
        self.correctBRadioBtn.isSelected = false
        self.correctCRadioBtn.isSelected = false
        self.correctDRadioBtn.isSelected = false
        lblDescription.text = "Question 1: \(multi.description ?? "")"
        lblQuestionA.text = multi.multiChoice[0]
        lblQuestionB.text = multi.multiChoice[1]
        lblQuestionC.text = multi.multiChoice[2]
        lblQuestionD.text = multi.multiChoice[3]
    }
    
    
    @IBAction func actionCheckA(_ sender: UIButton) {
        if correctARadioBtn.isSelected == true{
            correctARadioBtn.isSelected = false
        }
        else{
            correctARadioBtn.isSelected = true
            answer.append(0)
        }
    }
    @IBAction func actionCheckB(_ sender: UIButton) {
        if correctBRadioBtn.isSelected == true{
            correctBRadioBtn.isSelected = false
        }
        else{
            correctBRadioBtn.isSelected = true
            answer.append(1)
        }
    }
    @IBAction func actionCheckC(_ sender: UIButton) {
        if correctCRadioBtn.isSelected == true{
            correctCRadioBtn.isSelected = false
        }
        else{
            correctCRadioBtn.isSelected = true
            answer.append(2)
        }
    }
    @IBAction func actionCheckD(_ sender: UIButton) {
        if correctDRadioBtn.isSelected == true{
            correctDRadioBtn.isSelected = false
        }
        else{
            correctDRadioBtn.isSelected = true
            answer.append(3)
        }
    }
    //
    func checkAnswer(){
        answer = []
        if correctARadioBtn.isSelected == true{
            answer.append(0)
        }
        if correctBRadioBtn.isSelected == true{
            answer.append(1)
        }
        if correctCRadioBtn.isSelected == true{
            answer.append(2)
        }
        if correctDRadioBtn.isSelected == true{
            answer.append(3)
        }
    }
    
    // MARK: - Navigation
    var temp2:String!
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let button = sender as? UIButton , button === btnRight
        {
            checkAnswer()
            guard let pass2 = segue.destination as? High2ViewController else {return}
            check1.append(0)
            check1.append(0)
            check1.append(0)
            check1.append(0)
            
            check2.append(0)
            check2.append(0)
            check2.append(0)
            check2.append(0)
            //Truyen du lieu mang question sang basic2
            question.listQuestion[0].setQuestionAnswer(questionAnswer: answer)
            pass2.question.listQuestion.removeAll()
            pass2.question.listQuestion = question.listQuestion
            pass2.check2 = check1
            pass2.check3 = check2
            
        }
        else if let button = sender as? UIButton , button === btnFinish{
            checkAnswer()
            guard let passResult = segue.destination as? ResultViewController else {return}
            passResult.question.listQuestion.removeAll()
            question.listQuestion[0].setQuestionAnswer(questionAnswer: answer)
            passResult.question.listQuestion = question.listQuestion
            
        }//
    }
    @IBAction func unwindHigh2(_ sender:UIStoryboardSegue)
    {
        guard let receive = sender.source as? High2ViewController else {return}
        question.listQuestion.removeAll()
        question.listQuestion = receive.moveQuestion
        check1 = receive.check2
        check2 = receive.check3
    }
}
