//
//  QuestionViewController.swift
//  PersonalSurvey
//
//  Created by user on 22.02.2023.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!

    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!

    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!

    private var questionIndex = 0
    private var answersChosen: [Answer] = []

    private let questions = Question.getQuestions()
    private var currentAnswers : [Answer] { // вычисляемое свойство не требует инициализации
        questions[questionIndex].answers
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()

    }

    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        nextQuestion()
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

        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title

        let totalIndex = Float(questionIndex) / Float(questions.count)

        questionProgressView.setProgress(totalIndex, animated: true)

        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"

        showCurrentAnswers(for: currentQuestion.responseType)
    }

    private func showCurrentAnswers(for type: ResponseType) {
        switch type {

        case .single: showSingleStackView(with: currentAnswers)

        case .multiple: break

        case .ranged: break

        }
    }


    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }

    private func nextQuestion() {
        questionIndex += 1

        if questionIndex < questions.count {
            updateUi()
            return
        }

        performSegue(withIdentifier: "showresult", sender: nil)
    }
}

