//
//  QuestionViewController.swift
//  PersonalSurvey
//
//  Created by user on 22.02.2023.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!

    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!

    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!

    private let questions = Question.getQuestions()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()

    }

    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
    }

    @IBAction func multipleAnswerButtonPressed() {
    }


    @IBAction func rangeAnswerButtonPressed() {
    }

}

extension QuestionsViewController {
    private func updateUi() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
    }
}

