//
//  Basic3ViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/29/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class Basic3ViewController: UIViewController {
    
    @IBOutlet weak var btnLeft: UIButton!
    
    @IBOutlet weak var boolCorrectA: UILabel!
    @IBOutlet weak var boolCorrectB: UILabel!
    @IBOutlet weak var boolCorrectC: UILabel!
    @IBOutlet weak var boolCorrectD: UILabel!
    @IBOutlet weak var correctD: UISwitch!
    @IBOutlet weak var correctC: UISwitch!
    @IBOutlet weak var correctB: UISwitch!
    @IBOutlet weak var correctA: UISwitch!
    @IBOutlet weak var lblQuestionD: UILabel!
    @IBOutlet weak var lblQuestionC: UILabel!
    @IBOutlet weak var lblquestionB: UILabel!
    @IBOutlet weak var lblQuestionA: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    var question = ListQuestion()
    var answer:[Int] = []
    var moveQuestion:[Question] = []
    var trueFalse = TrueFalseQuestion()
    var check3:[Int] = []
    var check2:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if check3[0] == 1
        {
            correctA.isOn = true
            boolCorrectA.text = "True"
        }
        else{
            correctA.isOn = false
            boolCorrectA.text = "False"
        }
        if check3[1] == 1
        {
            correctB.isOn = true
            boolCorrectB.text = "True"
        }
        else{
            correctB.isOn = false
            boolCorrectB.text = "False"
        }

        if check3[2] == 1
        {
            correctC.isOn = true
            boolCorrectC.text = "True"
        }
        else{
            correctC.isOn = false
            boolCorrectC.text = "False"
        }
        if check3[3] == 1
        {
            correctD.isOn = true
            boolCorrectD.text = "True"
        }
        else{
            correctD.isOn = false
            boolCorrectD.text = "False"
        }
        btnRight.isEnabled = false
        btnRight.backgroundColor = UIColor.lightGray
        trueFalse = question.listQuestion[2] as! TrueFalseQuestion
        lblDescription.text = "Question 3: \(trueFalse.description ?? "")"
        lblQuestionA.text = trueFalse.trueFalse[0]
        lblquestionB.text = trueFalse.trueFalse[1]
        lblQuestionC.text = trueFalse.trueFalse[2]
        lblQuestionD.text = trueFalse.trueFalse[3]
    }
    func checkAnswer(){
        answer.removeAll()
        if correctA.isOn == true
        {
            answer.append(0)
        }
        if correctB.isOn == true
        {
            answer.append(1)
        }
        if correctC.isOn == true
        {
            answer.append(2)
        }
        if correctD.isOn == true
        {
            answer.append(3)
        }
    }
   
    @IBAction func switchA(_ sender: UISwitch) {
        if sender.isOn == true
        {
            correctA.isOn = true
            boolCorrectA.text = "True"
            answer.append(0)
            check3[0] = 1
        }
        else
        {
            correctA.isOn = false
            boolCorrectA.text = "False"
            check3[0] = 0
        }
    }
    
    @IBAction func switchB(_ sender: UISwitch) {
        if sender.isOn == true
        {
            correctB.isOn = true
            boolCorrectB.text = "True"
            answer.append(1)
            check3[1] = 1
        }
        else
        {
            correctB.isOn = false
            boolCorrectB.text = "False"
            check3[1] = 0
        }
    }
    
    
    @IBAction func switchC(_ sender: UISwitch) {
        if sender.isOn == true
        {
            correctC.isOn = true
            boolCorrectC.text = "True"
            answer.append(2)
            check3[2] = 1
        }
        else
        {
            correctC.isOn = false
            boolCorrectC.text = "False"
            check3[2] = 0
        }
    }
    
    @IBAction func switchD(_ sender: UISwitch) {
        if sender.isOn == true
        {
            correctD.isOn = true
            boolCorrectD.text = "True"
            answer.append(3)
            check3[3] = 1
        }
        else
        {
            correctD.isOn = false
            boolCorrectD.text = "False"
            check3[3] = 0
        }
    }
    // MARK: - Navigation
    // In a storyboard-based application, yo;u will often want to do a little preparation before navigation
    // MARK: - Navigation
    var ck:[Int] = []
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        if let button = sender as? UIButton , button === btnLeft
        {
            ck = check3
            checkAnswer()
            moveQuestion = question.listQuestion
            moveQuestion[2].setQuestionAnswer(questionAnswer: answer)
        }
        else if let button = sender as? UIButton , button === btnFinish{
            checkAnswer()
            guard let passResult = segue.destination as? ResultViewController else {return}
            passResult.question.listQuestion.removeAll()
            question.listQuestion[2].setQuestionAnswer(questionAnswer: answer)
            passResult.question.listQuestion = question.listQuestion
        }//
    }
}
