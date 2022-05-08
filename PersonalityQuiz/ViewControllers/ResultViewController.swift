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
   
    private func getUserResult() {
        
        var frequencyOfAnimal: [Animal: Int] = [:]
        let animals = userAnswers.map { $0.animal } // перебирает массив userAnswers, извлекает свойство animal и добавляет в новый массив animals
        
        for animal in animals {
           // проверка есть ли в словаре значение по ключу animal, присваивает его переменной animalTypeCount
            if let animalTypeCount = frequencyOfAnimal[animal] {
                // увеличивает значение по ключу animal на 1
                frequencyOfAnimal.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                // создает новую пару с ключом animal и присваивает ей значение 1
                frequencyOfAnimal[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimal.sorted { $0.value > $1.value } // сортирует словарарь от большего к меньшему
        guard let mostFrequentlyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequentlyAnimal)
    }
    private func updateUI(with  animal: Animal) {
        animalLabel.text = "Вы = \(animal.rawValue) !"
        definitionLabel.text = animal.definition
        
    }

}

/*
 //  Мое старое решение
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
*/
