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
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        //view.window?.rootViewController?.dismiss(animated: true) //вернёмся до главного viewController
        navigationController?.dismiss(animated: true)
    }

//    deinit {
//        print("Выгружен из памяти")
//    }
}
