//
//  ViewController.swift
//  Project2
//
//  Created by Łukasz Rajczewski on 28/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        var message: String
        var action: String

        if sender.tag == correctAnswer {
            title = "Correct!"
            message = "That was good answer, Your score is \(score + 1)"
            score += 1
        } else {
            title = "Wrong!"
            message = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }

        if totalQuestion == 10 {
            title = "Your Result of 10 Question"
            message = "You have \(score) good answer!"
            action = "AGAIN"
            
            score = 0
            totalQuestion = 0
            
        } else {
            action = "CONTINUE"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: action, style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) / SCORE: \(score)"

        totalQuestion += 1
        
    }

}

