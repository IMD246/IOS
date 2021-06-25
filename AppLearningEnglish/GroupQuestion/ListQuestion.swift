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
        multichoice.setDescription(newDescription: ".. Fish,... Many Fish")
        multichoice.setMultiChoice(newMultiChoice: ["A","An","The","None"])
        multichoice.setQuestionCorrect(newQuestionCorrect: [0,2])
        listQuestion.append(multichoice)
        
        let multichoice2 = MultiQuestion()
        multichoice2.level = "High"
        multichoice2.setDescription(newDescription: "Would you ... to date")
        multichoice2.setMultiChoice(newMultiChoice: ["like","want","none","wont"])
        multichoice2.setQuestionCorrect(newQuestionCorrect: [0,1])
        listQuestion.append(multichoice2)
        
        //Multiquesion 2
        let oneChoice1 = OneChoiceQuestion()
        oneChoice1.level = "Basic"
        oneChoice1.setDescription(newDescription: ".. Elephent")
        oneChoice1.setOneChoice(newOneChoice: ["a","an","the","none"])
        oneChoice1.setQuestionCorrect(newQuestionCorrect:[1])
        listQuestion.append(oneChoice1)
        
        //OneChoiceQuestion
        let oneChoice2 = OneChoiceQuestion()
        oneChoice2.level = "High"
        oneChoice2.setDescription(newDescription: "How much is speed of light?")
        oneChoice2.setOneChoice(newOneChoice: ["6000km/h","600000m/s","300000m/s","3000km/h"])
        oneChoice2.setQuestionCorrect(newQuestionCorrect: [2])
        listQuestion.append(oneChoice2)
        //TrueFalsequestion1
        let trueFalse1 = TrueFalseQuestion()
        trueFalse1.level = "Basic"
        trueFalse1.setDescription(newDescription: "Choose correct answers for per topic")
        trueFalse1.setTrueFalseQuestion(newTrueFalse: ["Tony Stark is Captain American","Spider has six eyes","Flies has eight foot","Spider man is not from Marvel"])
        trueFalse1.setQuestionCorrect(newQuestionCorrect: [1,2])
        listQuestion.append(trueFalse1)
        //TrueFalseQuestion2
        let trueFalse2 = TrueFalseQuestion()
        trueFalse2.level = "High"
        trueFalse2.setDescription(newDescription: "Choose correct answers for per topic")
        trueFalse2.setTrueFalseQuestion(newTrueFalse: ["Loki is not from Asgard","The Whale has white color","The tiger is lord of the jungle","I bet you dont have girl-friend"])
        trueFalse2.setQuestionCorrect(newQuestionCorrect: [1,3])
        listQuestion.append(trueFalse2)
    }
}
