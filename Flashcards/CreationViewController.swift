//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Alex Rankine on 10/27/18.
//  Copyright © 2018 Alex Rankine. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let answer1Text = answer1.text
        let answer2Text = answer2.text
        let answer3Text = answer3.text
    flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, c1: answer1Text!, c2: answer2Text!, c3: answer3Text!)
        
        dismiss(animated: true)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
}
