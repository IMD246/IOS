//
//  ResultViewController.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/3/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var lbQuestionA: UILabel!
    @IBOutlet weak var lbQuestionB: UILabel!
    @IBOutlet weak var lbQuestionC: UILabel!
    @IBOutlet weak var lbTotal: UILabel!
    
    @IBOutlet weak var result1: UILabel!
    @IBOutlet weak var result2: UILabel!
    @IBOutlet weak var result3: UILabel!
    var listData = listUser()
    let question = ListQuestion()
    var level:[String] = []
    @IBOutlet weak var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        level = handleQuestions(lQues: question)
        result1.text = level[0]
        result2.text = level[1]
        result3.text = level[2]
        let total = handlePoint(lQues: question)
        listData.updateScore(username: userNameLoginData.userName, score: total)
        lbTotal.text = "\(total)"
        //print("Tong: \(tong)")
    }
    func handleQuestions(lQues:ListQuestion)->[String]{
        var type:[String] = []
        //var tong = 0
        var dem:Int = 0
        for i in 0..<lQues.listQuestion.count{
            dem += 1
            if lQues.listQuestion[i].getPoint() == true{
                type.append("Correct")
                //tong += 2
            }
            else{
                type.append("Wrong")
            }
        }
        return type
    }
    func handlePoint(lQues:ListQuestion)->Int{
        var tong = 0
        var dem:Int = 0
        for i in 0..<lQues.listQuestion.count{
            dem += 1
            if lQues.listQuestion[i].getPoint() == true{
                //type.append("Cau \(dem): dung")
                tong += 2
            }
        }
        return tong
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
