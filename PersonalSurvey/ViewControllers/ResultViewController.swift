//
//  ResultViewController.swift
//  PersonalSurvey
//
//  Created by user on 22.02.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    var answer: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        //view.window?.rootViewController?.dismiss(animated: true) //вернёмся до главного viewController
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answer.map { $0.animal } // перебирает массив и возвращает сам массив

        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }

        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted{ $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }

        updateUi(with: mostFrequencyAnimal)

    }

    private func updateUi(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
