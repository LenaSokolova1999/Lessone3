//
//  ViewController.swift
//  Locale
//
//  Created by Mac Mini 2018 on 08.07.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Public properties

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var answer: UILabel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// MARK: - Public metod

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.greetings(true)
    }

    @IBAction func showButton(_ sender: Any) {
        super.viewDidAppear(true)
        self.addition()
    }

    @IBAction func show(_ sender: Any) {
        super.viewDidAppear(true)
        self.guessTheNumber()
    }

    func greetings(_ animated: Bool) {
        let nameAlert = UIAlertController(title: NSLocalizedString("welcome".localized(), comment: ""), message: "enter_your_name".localized(), preferredStyle: .alert)
        nameAlert.addTextField { (textField) in textField.placeholder = "enter_your_name".localized() }
        nameAlert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            let text = nameAlert.textFields?.first

            if text?.text == "" {
                text?.text = "player".localized()
            }

            self.nameLabel.text! += (", ") + (text?.text ?? "player".localized())! + ("!")
        })
        present(nameAlert, animated: true, completion: nil)
    }

    func addition() {
        let gameOneAlert = UIAlertController(title: "addition".localized(), message: "enter_two_numbers".localized(), preferredStyle: .alert)
        gameOneAlert.addTextField { (textField) in
            textField.keyboardType = .asciiCapableNumberPad
            textField.placeholder = "enter_the_number".localized()
        }

        gameOneAlert.addTextField { (textField) in
            textField.keyboardType = .asciiCapableNumberPad
            textField.placeholder = "enter_the_number".localized()
        }

        gameOneAlert.addAction(UIAlertAction(title: "ОК", style: .default) { [self] action in
            let firstNumber = gameOneAlert.textFields?.first
            let secondNumber = gameOneAlert.textFields?.last

            if firstNumber?.text == "" {
                firstNumber?.text = "0"
            }

            if secondNumber?.text == "" {
                secondNumber?.text = "0"
            }

            let sum = (firstNumber?.text ?? "0") + ("+") + (secondNumber?.text ?? "0")
            let sumAnswer = String((Int(firstNumber?.text ?? "0") ?? 0) + (Int(secondNumber?.text ?? "0") ?? 0))

            let alert = UIAlertController(title: "answer".localized(), message: "\(sumAnswer)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in })
            self.present(alert, animated: true, completion: nil)

            self.answer.text! = (sum) + ("=") + (sumAnswer)
        })
        present(gameOneAlert, animated: true, completion: nil)
    }

    func guessTheNumber() {
        let gameTwoAlert = UIAlertController(title: "guess_the_number".localized(), message: "please_enter_a_number_between_0_and_9".localized(), preferredStyle: .alert)

        gameTwoAlert.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = "enter_the_number".localized()
        }

        gameTwoAlert.addAction(UIAlertAction(title: "ОК", style: .default) { action in
            let number = gameTwoAlert.textFields?.first
            let randomInt = Int.random(in: 0..<9)
            if number?.text == "" {
                number?.text = "0"
            }
            self.answer.text! = ("your_number".localized()) + String(number?.text ?? "0") + ("the_hidden_number".localized()) + String(randomInt)

            if String(number?.text ?? "0") == String(randomInt) {
                super.viewDidAppear(true)
                let alertVictory = UIAlertController(title: "hooray".localized(), message: "you_won".localized(), preferredStyle: .alert)
                alertVictory.addAction(UIAlertAction(title: "OK", style: .default) { action in })
                self.present(alertVictory, animated: true, completion: nil)
            }

            else if String(number?.text ?? "0") != String(randomInt) {
                super.viewDidAppear(true)
                let alertDefeat = UIAlertController(title: "alas".localized(), message: "you_lose".localized(), preferredStyle: .alert)
                alertDefeat.addAction(UIAlertAction(title: "OK", style: .default) { action in })
                self.present(alertDefeat, animated: true, completion: nil)
            }
        })
        present(gameTwoAlert, animated: true, completion: nil)
    }
}
