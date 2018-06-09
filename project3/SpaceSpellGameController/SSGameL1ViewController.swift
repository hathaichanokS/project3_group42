//
//  SSGameL1ViewController.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 5/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//




import UIKit

/*class SSGameL1ViewController: UIViewController {
    
    lazy var game = SpaceSpell(level: 1)
    private weak var repeatTimer: Timer?
    private weak var updateTimer: Timer?
    private weak var finishTimer: Timer?
    
    var timeLeft = 30
    
    var questionRecord : [Character] = [" "," "," "]
    var choiceRecord : [Character] = [" "," "," "," "]
    
    @IBOutlet weak var TimeLeftLabel: UILabel!
    
    @IBOutlet var question: [UIImageView]!
    
    @IBOutlet var choices: [UIButton]!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet var chanceIcon: [UIImageView]!
    
    func setUpQuestion() {
        for i in 0...2 {
            question[i].image = UIImage.init(named: "\(game.QuestionChars[i]).png")
            questionRecord[i] = game.QuestionChars[i]
        }
        
        for i in 0...3 {
            choices[i].setImage(UIImage(named: "\(game.choices[i]).png"), for: UIControlState.normal)
            choiceRecord[i] = game.choices[i]
        }
        
    }
    
    
    @IBAction func Tap(_ sender: UIButton) {
        for i in 0...3 {
            if sender == choices[i]{
                if game.choose(choice: choiceRecord[i]) {
                    for j in 0...2 {
                        if questionRecord[j] == "_"{
                            question[j].image = UIImage.init(named: "\(game.correctAnswer).png")
                        }
                    }
                } else {
                    if game.chances == 0 {
                        self.performSegue(withIdentifier: "SS Game Over", sender: self)
                    } else {
                        chanceIcon[game.chances-1].image = nil
                    }
                }
            }
        }
        ScoreLabel.text = "\(game.score)"
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpQuestion()
        
        repeatTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.timeLeft = self.timeLeft - 1
            self.TimeLeftLabel.text = "\(self.timeLeft)"
        }
        
        updateTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.game.setup()
            self.setUpQuestion()
        }
        
        finishTimer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false){ timer in
            self.repeatTimer?.invalidate()
            self.performSegue(withIdentifier: "SS Game Over", sender: self)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SS Game Over" {
            if let govc = segue.destination as? SSGameOverViewController {
                govc.score = game.score
            }
        }
    }
    
    
}*/
