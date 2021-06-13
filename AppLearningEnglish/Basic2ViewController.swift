//
//  Basic2ViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/29/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class Basic2ViewController: UIViewController {
    
    @IBOutlet weak var correctACheckbox: UIButton!
    @IBOutlet weak var correctBCheckbox: UIButton!
    @IBOutlet weak var correctCCheckbox: UIButton!
    @IBOutlet weak var correctDCheckbox: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblQuestionB: UILabel!
    @IBOutlet weak var lblQuestionA: UILabel!
    @IBOutlet weak var lblQuestionC: UILabel!
    @IBOutlet weak var lblQuestionD: UILabel!
    var answer:[Int] = []
    var question = ListQuestion()
    var moveQuestion:[Question] = []
    var oneChoice = OneChoiceQuestion()
    var check2:[Int] = []
    var check3:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //Gan du lieu tu basic 1 vao mang
        if check2[0] == 1
        {
            correctACheckbox.isSelected = true
        }
        else{
            correctACheckbox.isSelected = false
        }
        if check2[1] == 1
        {
            correctBCheckbox.isSelected = true
        }
        else{
            correctBCheckbox.isSelected = false
        }
        if check2[2] == 1
        {
            correctCCheckbox.isSelected = true
        }
        else{
            correctCCheckbox.isSelected = false
        }
        if check2[3] == 1
        {
            correctDCheckbox.isSelected = true
        }
        else{
            correctDCheckbox.isSelected = false
        }
        
        oneChoice = question.listQuestion[1] as! OneChoiceQuestion
        lblDescription.text = "Question 2: \(oneChoice.description ?? "")"
        lblQuestionA.text = oneChoice.oneChoice[0]
        lblQuestionB.text = oneChoice.oneChoice[1]
        lblQuestionC.text = oneChoice.oneChoice[2]
        lblQuestionD.text = oneChoice.oneChoice[3]
    }
    
    
    @IBAction func actionCheckA(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.correctACheckbox.isSelected = false
        }else{
            self.correctACheckbox.isSelected = true
            self.correctBCheckbox.isSelected = false
            self.correctCCheckbox.isSelected = false
            self.correctDCheckbox.isSelected = false
            check2[0] = 1
            answer.append(0)
        }
        
    }
    @IBAction func actionCheckB(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.correctBCheckbox.isSelected = false
        }else{
            self.correctBCheckbox.isSelected = true
            self.correctACheckbox.isSelected = false
            self.correctCCheckbox.isSelected = false
            self.correctDCheckbox.isSelected = false
            check2[1] = 1
            answer.append(1)
        }
    }
    @IBAction func actionCheckC(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.correctCCheckbox.isSelected = false
        }else{
            self.correctCCheckbox.isSelected = true
            self.correctACheckbox.isSelected = false
            self.correctBCheckbox.isSelected = false
            self.correctDCheckbox.isSelected = false
            check2[2] = 1
            answer.append(2)
        }
        
    }
    @IBAction func actionCheckD(_ sender: UIButton) {
        answer.removeAll()
        if sender.isSelected{
            self.correctDCheckbox.isSelected = false
        }else{
            self.correctDCheckbox.isSelected = true
            self.correctACheckbox.isSelected = false
            self.correctBCheckbox.isSelected = false
            self.correctCCheckbox.isSelected = false
            check2[3] = 1
            answer.append(3)
        }
    }
    func checkAnswer(){
        answer.removeAll()
        if correctACheckbox.isSelected == true{
            answer.append(0)
        }
        if correctBCheckbox.isSelected == true{
            answer.append(1)
        }
        if correctCCheckbox.isSelected == true{
            answer.append(2)
        }
        if correctDCheckbox.isSelected == true{
            answer.append(3)
        }
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        if let button = sender as? UIButton , button === btnRight
        {
            checkAnswer()
            guard let pass2 = segue.destination as? Basic3ViewController else {return}
            
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
        else if let button = sender as? UIButton , button === btnFinish{
            checkAnswer()
            guard let passResult = segue.destination as? ResultViewController else {return}
            passResult.question.listQuestion.removeAll()
            question.listQuestion[1].setQuestionAnswer(questionAnswer: answer)
            passResult.question.listQuestion = question.listQuestion
        }//
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func unwindBasic3(_ sender:UIStoryboardSegue)
    {
        guard let receive = sender.source as? Basic3ViewController else {return}
        question.listQuestion.removeAll()
        question.listQuestion = receive.moveQuestion
        check3 = receive.ck
    }
}
