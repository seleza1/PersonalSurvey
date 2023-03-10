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

    @IBOutlet var singleStackViewTwo: UIStackView!
    @IBOutlet var singleButtonTwo: [UIButton]!

    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!

    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount =  Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultViewController = segue.destination as? ResultViewController else { return }
        resultViewController.answer = answersChosen
    }

    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        nextQuestion()
    }

    @IBAction func singleButtonPressedTwo(_ sender: UIButton) {
        guard let index = singleButtonTwo.firstIndex(of: sender) else { return }
        let answer = currentAnswers[index]
        answersChosen.append(answer)
        nextQuestion()
    }


    @IBAction func multipleButtonAnswerPressed() {
        for (multipleSwitches, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitches.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }

    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value) // округляем float до целых
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
}

extension QuestionsViewController {
    private func updateUi() {
        for stackView in [singleStackView, multipleStackView, rangedStackView, singleStackViewTwo] {
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
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangedStackView(with: currentAnswers)
        case .two: showSingleStackViewTwo(with: currentAnswers)
        }
    }

    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()

        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }

    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden.toggle()

        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }

    private func showRangedStackView(with answers: [Answer]) {  // если в массиве всего 2 элемента, то мы можем обращаться к нему first, last
        rangedStackView.isHidden.toggle()

        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }

    private func showSingleStackViewTwo(with answers: [Answer]) {
        singleStackViewTwo.isHidden.toggle()

        for (button, answer) in zip(singleButtonTwo, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }


    private func nextQuestion() {
        questionIndex += 1

        if questionIndex < questions.count {
            updateUi()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}

