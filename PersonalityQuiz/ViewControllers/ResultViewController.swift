//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var userAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getUserResult()
    }
    
    // Наверняка есть более изящный способ посчитать количество и вывести результат, кажется это не он.
    private func getUserResult() {
        
        var animals: [Animal] = []
        
        for userAnswer in userAnswers {
            animals.append(userAnswer.animal)
        }
        
        var catCount = 0
        var dogCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        for animal in animals {
            switch animal {
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        
        if catCount > dogCount,
           catCount > rabbitCount,
           catCount > turtleCount {
            animalLabel.text = "Вы = \(Animal.cat.rawValue)"
            definitionLabel.text = Animal.cat.definition
        } else if dogCount > catCount,
                  dogCount > rabbitCount,
                  dogCount > turtleCount {
            animalLabel.text = "Вы = \(Animal.dog.rawValue)"
            definitionLabel.text = Animal.dog.definition
        } else if rabbitCount > catCount,
                  rabbitCount > dogCount,
                  rabbitCount > turtleCount {
            animalLabel.text = "Вы = \(Animal.rabbit.rawValue)"
            definitionLabel.text = Animal.rabbit.definition
        } else if turtleCount > catCount,
                  turtleCount > dogCount,
                  turtleCount > rabbitCount {
            animalLabel.text = "Вы = \(Animal.turtle.rawValue)"
            definitionLabel.text = Animal.turtle.definition
        }
    }
}
