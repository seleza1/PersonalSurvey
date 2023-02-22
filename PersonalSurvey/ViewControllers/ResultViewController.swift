//
//  ResultViewController.swift
//  PersonalSurvey
//
//  Created by user on 22.02.2023.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        //view.window?.rootViewController?.dismiss(animated: true) //вернёмся до главного viewController
        navigationController?.dismiss(animated: true)
    }

//    deinit {
//        print("Выгружен из памяти")
//    }
}
