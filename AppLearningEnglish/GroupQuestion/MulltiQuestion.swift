//
//  MulltiQustion.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/5/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//
import UIKit
class MultiQuestion: Question{
    var multiChoice:[String]
        = []
    
    func getMultiChoice()->[String]{
        return self.multiChoice
    }
    func setMultiChoice(newMultiChoice:[String]){
        for i:String in newMultiChoice {
            self.multiChoice.append(i)
        }
    }
    
    override init() {
        super.init()
        self.multiChoice = Array<String>()
        self.questionAnswer = Array<Int>()
        self.questionCorrect = Array<Int>()
    }
    
    override func getPoint() -> Bool {
        return super.getPoint()
    }
}
