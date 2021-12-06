//
//  GameViewController.swift
//  WhoWantsToBe
//
//  Created by Kiryusha Orlov on 06.12.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerLabel: UIButton!
    @IBOutlet weak var secondAnswerLabel: UIButton!
    @IBOutlet weak var thirdAnswerLabel: UIButton!
    @IBOutlet weak var fourthAnswerLabel: UIButton!
    
    // MARK: - Actions
    
    @IBAction func firstAnswerButton(_ sender: Any) {
        checkAnswer(numberOfButton: 0)
    }
    
    @IBAction func secondAnswerButton(_ sender: Any) {
        checkAnswer(numberOfButton: 1)
    }
    
    @IBAction func thirdAnswerButton(_ sender: Any) {
        checkAnswer(numberOfButton: 2)
    }
    
    @IBAction func fourthAnswerButton(_ sender: Any) {
        checkAnswer(numberOfButton: 3)
    }
    
    // MARK: - Vars
    
    var questions: [Question] = []
    var questionsCounter = 0
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupQuestion()
        
    }
    
    
    
    // MARK: - Functions
    func setupData() {
        
        let firstQuestion = Question(name: "Сколько весит Int?", answers: ["1 байт", "2 байта", "8 байт", "16 байт"], rightAnswers: 2, spectatorsVote: [20,3,67,10], fiftyFiftyAnswer: 1)
        let secondQuestion = Question(name: "Сколько весит экземпляр класса?", answers: ["1 бит", "8 бит", "8 байт", "В зависимости от переменных"], rightAnswers: 2, spectatorsVote: [15,45,25,15], fiftyFiftyAnswer: 1)
        let thirdQuestion = Question(name: "Сколько весит экземпляр структуры?", answers: ["1 бит", "8 бит", "8 байт", "В зависимости от переменных"], rightAnswers: 3, spectatorsVote: [15,5,25,55], fiftyFiftyAnswer: 2)
        let fourthQuestion = Question(name: "Какого типы ссылок нет в Swift?", answers: ["weak", "unknown" ,"strong", "unowned"], rightAnswers: 1, spectatorsVote: [4,45,6,45], fiftyFiftyAnswer: 3)
        let fifthQuestion = Question(name: "Максимально большое число в UIInt16", answers: ["15", "16", "32767", "65535"], rightAnswers: 3, spectatorsVote: [30,30,5,35], fiftyFiftyAnswer: 1)
        let sixthQuestion = Question(name: "В какой области памяти хранятся классы?", answers: ["Куча", "Стек", "Realm", "Рабочий стол"], rightAnswers: 0, spectatorsVote: [62,18,13,7], fiftyFiftyAnswer: 1)
        let seventhQuestion = Question(name: "В честь кого назван регистр, который используется при создании переменных", answers: ["Верблюд", "Марк Цукерберг","Сергей Брин", "Билл Гейтс"], rightAnswers: 0, spectatorsVote: [10,30,25,35], fiftyFiftyAnswer: 3)
        let eighthQuestion = Question(name: "Как называется код, который достался 'в наследство' от других разработчиков", answers: ["Печальный", "Легаси", "Оригинальный", "Неоригинальный"], rightAnswers: 1, spectatorsVote: [6,92,1,1], fiftyFiftyAnswer: 0)
        let ninthQuestion = Question(name: "Принцип работы стека", answers: ["LIFO", "LILO", "FIFO", "FILO"], rightAnswers: 0, spectatorsVote: [25,25,25,25], fiftyFiftyAnswer: 2)
        let tenthQuestion = Question(name: "Средство для очистки кучи - это ...", answers: ["CCleaner", "Garbage Collector", "Reference Counting", "Вручную"], rightAnswers: 2, spectatorsVote: [2,52,31,15], fiftyFiftyAnswer: 1)
        
        questions = [firstQuestion, secondQuestion, thirdQuestion, fourthQuestion, fifthQuestion, sixthQuestion, seventhQuestion, eighthQuestion, ninthQuestion, tenthQuestion]
        
    }
    
    func setupQuestion() {
        
        questionLabel.text = questions[questionsCounter].name
        firstAnswerLabel.setTitle(questions[questionsCounter].answers[0], for: .normal)
        secondAnswerLabel.setTitle(questions[questionsCounter].answers[1], for: .normal)
        thirdAnswerLabel.setTitle(questions[questionsCounter].answers[2], for: .normal)
        fourthAnswerLabel.setTitle(questions[questionsCounter].answers[3], for: .normal)
        
    }
    
    func checkAnswer(numberOfButton: Int) {
        
        let rightAnswer = questions[questionsCounter].rightAnswers
        if rightAnswer == numberOfButton {
            questionsCounter += 1
            if questionsCounter == questions.count {
                print("MALADEC")
            } else {
                setupQuestion()
            }
            
        } else {
            print("You lose!")
        }
        
    }
}
