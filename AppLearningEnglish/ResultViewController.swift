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
    
    let question = ListQuestion()
    var level:[String] = []
    @IBOutlet weak var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        level = handleQuestions(lQues: question)
//        lbQuestionA.text = level[0]
//        lbQuestionB.text = level[1]
//        lbQuestionC.text = level[2]
        let total = handlePoint(lQues: question)
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
                type.append("Cau \(dem): dung")
                //tong += 2
            }
            else{
                type.append("Cau \(dem): sai")
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
