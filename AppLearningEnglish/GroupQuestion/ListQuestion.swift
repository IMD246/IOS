//
//  ListQuestion.swift
//  AppLearningEnglish
//
//  Created by CNTT on 6/5/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit
class ListQuestion{
    var listQuestion:[Question] = []
    func getAllQuest(){
        let multichoice = MultiQuestion()
        multichoice.level = "Basic"
        multichoice.setDescription(newDescription: "1+1=")
        multichoice.setMultiChoice(newMultiChoice: ["2","two","6","8"])
        multichoice.setQuestionCorrect(newQuestionCorrect: [0,1])
        listQuestion.append(multichoice)
        
        let multichoice2 = MultiQuestion()
        multichoice2.level = "High"
        multichoice2.setDescription(newDescription: "What the hell")
        multichoice2.setMultiChoice(newMultiChoice: ["2","4","6","8"])
        multichoice2.setQuestionCorrect(newQuestionCorrect: [0,1])
        listQuestion.append(multichoice2)
        
        //Multiquesion 2
        let oneChoice1 = OneChoiceQuestion()
        oneChoice1.level = "Basic"
        oneChoice1.setDescription(newDescription: "Con cuu nhan giong vo tinh thanh cong dau tien ten la gi?")
        oneChoice1.setOneChoice(newOneChoice: ["Dola","Trump","Vanhein","Dolly"])
        oneChoice1.setQuestionCorrect(newQuestionCorrect:[3])
        listQuestion.append(oneChoice1)
        
        //OneChoiceQuestion
        let oneChoice2 = OneChoiceQuestion()
        oneChoice2.level = "High"
        oneChoice2.setDescription(newDescription: "Van toc anh sang la bao nhieu?")
        oneChoice2.setOneChoice(newOneChoice: ["6000km/h","600000m/s","300000m/s","3000km/h"])
        oneChoice2.setQuestionCorrect(newQuestionCorrect: [2])
        listQuestion.append(oneChoice2)
        //TrueFalsequestion1
        let trueFalse1 = TrueFalseQuestion()
        trueFalse1.level = "Basic"
        trueFalse1.setDescription(newDescription: "Lua chon cau tra loi dung cho moi menh de")
        trueFalse1.setTrueFalseQuestion(newTrueFalse: ["Ban co ban gai chua?","Nhen co 6 mat","Ruoi co 8 chan","null"])
        trueFalse1.setQuestionCorrect(newQuestionCorrect: [1,2,3])
        listQuestion.append(trueFalse1)
        //TrueFalseQuestion2
        let trueFalse2 = TrueFalseQuestion()
        trueFalse2.level = "High"
        trueFalse2.setDescription(newDescription: "Lua chon cau tra loi dung cho moi menh de")
        trueFalse2.setTrueFalseQuestion(newTrueFalse: ["Ban co ban gai chua?","Nhen co 6 mat","Ruoi co 8 chan","null"])
        trueFalse2.setQuestionCorrect(newQuestionCorrect: [1,2,3])
        listQuestion.append(trueFalse2)
    }
}
