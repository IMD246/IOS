//
//  TrueFasleQuestion.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/5/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
class TrueFalseQuestion: Question{
    var trueFalse:[String]
        = []
    
    func getTrueFalseQuestion()->[String]{
        return self.trueFalse
    }
    func setTrueFalseQuestion(newTrueFalse:[String]){
        for i:String in newTrueFalse {
            self.trueFalse.append(i)
        }
    }
    
    override init() {
        super.init()
        self.trueFalse = Array<String>()
        self.questionAnswer = Array<Int>()
        self.questionCorrect = Array<Int>()
    }
    override func getPoint() -> Bool {
        return super.getPoint()
    }
}
