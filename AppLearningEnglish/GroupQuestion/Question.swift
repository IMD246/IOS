//
//  Question.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/1/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
class Question{
    var description:String?
    var level:String?
    var questionAnswer:Array<Int> = []
    var questionCorrect:Array<Int> = []
    
    func getDescription()->String{
        return self.description ?? ""
    }
    func getQuestionAnswer()->[Int]{
        return self.questionAnswer
    }
    func getQuestionCorrect() -> [Int] {
        return self.questionCorrect
    }
    func getLevelQuestion()->String{
        return self.level ?? ""
    }
    
    func setLevel(newLevel:String) {
        level = newLevel
    }
    func setDescription(newDescription:String){
        description = newDescription
    }
    func setQuestionAnswer(questionAnswer:[Int]) {
        self.questionAnswer = questionAnswer
    }
    func setQuestionCorrect(newQuestionCorrect:[Int]){
        questionCorrect = newQuestionCorrect
    }
    func getPoint() -> Bool {
        var j:Int = 0
        if questionCorrect.count == questionAnswer.count{
            for i in 0..<questionAnswer.count{
                if questionCorrect[i] == questionAnswer[i]{
                    j += 1
                }
            }
        }
        else{
            return false
        }
        if j == questionAnswer.count{
            return true
        }
        return false
    }
}
