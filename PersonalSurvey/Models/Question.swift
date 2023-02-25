//
//  Question.swift
//  PersonalSurvey
//
//  Created by user on 22.02.2023.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]

    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Что вы делаете после того как проснулись?",
                responseType: .single,
                answers: [
                    Answer(title: "Беру телефон в руки", animal: .zombie),
                    Answer(title: "Иду умываться", animal: .commonPerson),
                    Answer(title: "Делаю записи в дневник", animal: .deliberate),
                    Answer(title: "Делаю зарядку, сажусь за учёбу", animal: .reality)
                ]
            ),

            Question(
                title: "Вы что-то смотрите когда кушаете?",
                responseType: .two,
                answers: [
                    Answer(title: "Да, смотрю ютубе, сижу в соц.сетях", animal: .zombie),
                    Answer(title: "Нет, в моих руках во время еды только столовый прибор", animal: .deliberate)
                ]
            ),
            Question(
                title: "Как вы проводите своё свободное время чаще всего?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Смотрю тик-ток, сижу в соц.сетях", animal: .zombie),
                    Answer(title: "Занимаюсь саморазвитием", animal: .reality),
                    Answer(title: "Занимаюсь спортом", animal: .deliberate),
                    Answer(title: "Гуляю", animal: .commonPerson)
                ]
            ),
            Question(
                title: "Любите ли вы проводить время в одиночестве?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .zombie),
                    Answer(title: "Нервничаю", animal: .deliberate),
                    Answer(title: "Не замечаю", animal: .commonPerson),
                    Answer(title: "Обожаю", animal: .reality)
                ]
            ),
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
    case two
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case zombie = "🧟‍♂️"
    case commonPerson = "🙎"
    case deliberate = "🤴"
    case reality = "🥷"

    var definition: String {
        switch self {
        case .zombie:
            return "Вы тратите своё время и направляете свои силы не в то русло."
        case .commonPerson:
            return "Вы проживаете свою жизнь как обычный человек."
        case .deliberate:
            return "Вы на правильном пути, продолжайте в том же духе."
        case .reality:
            return "Вы понимаете что происходит в вашей жизни и управляете своей реальностью."
        }
    }
}
