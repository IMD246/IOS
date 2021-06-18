//
//  LevelQuestionsViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/6/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class LevelQuestionsViewController: UIViewController {
    
    @IBOutlet weak var btnBasic: UIButton!
    
    @IBOutlet weak var btnHigh: UIButton!
    //
    let listQuestions = ListQuestion()
    let questions:[Question] = []
    var levelQuestions:String = ""
    var temp:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        listQuestions.getAllQuest()
        let tab = tabBarController?.viewControllers
        let pro = tab![0] as! ProfileViewController
        temp = pro.temp
        print(temp ?? "")
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton , button === btnBasic
        {
            guard let levelBasic = segue.destination as? Basic1ViewController else {return}
            for i in 0..<listQuestions.listQuestion.count{
                if listQuestions.listQuestion[i].getLevelQuestion() == "Basic"{
                    levelBasic.question.listQuestion.append(listQuestions.listQuestion[i])
                }
            }
            
        }
        else if let button = sender as? UIButton , button === btnHigh
        {
            guard let levelHigh = segue.destination as? High1ViewController else {return}
            for i in 0..<listQuestions.listQuestion.count{
                if listQuestions.listQuestion[i].getLevelQuestion() == "High"{
                    levelHigh.question.listQuestion.append(listQuestions.listQuestion[i])
                }
            }
        }
    }
    @IBAction func unWindFromResult(_ sender:UIStoryboardSegue)
    {
        listQuestions.listQuestion.removeAll()
        listQuestions.getAllQuest()
    }
}
