//
//  OneChoiceQuestion.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/5/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
class OneChoiceQuestion: Question{
    var oneChoice:[String]
        = []
    
    func getOneChoice()->[String]{
        return self.oneChoice
    }
    func setOneChoice(newOneChoice:[String]){
        for i:String in newOneChoice {
            self.oneChoice.append(i)
        }
    }
    
    override init() {
        super.init()
        self.oneChoice = Array<String>()
        self.questionAnswer = Array<Int>()
        self.questionCorrect = Array<Int>()
    }
    override func getPoint() -> Bool {
        return super.getPoint()
    }
}
