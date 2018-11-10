//
//  ViewController.swift
//  Flashcards
//
//  Created by Alex Rankine on 10/13/18.
//  Copyright © 2018 Alex Rankine. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var c1: String
    var c2: String
    var c3: String
}

class ViewController: UIViewController {

    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
     @IBOutlet weak var nextButton: UIButton!
   
    // Flashcards array
    var flashcards = [Flashcard]()
    // Current index of flashcards
    var currentIndex = 0
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        qLabel.isHidden = !qLabel.isHidden;
        aLabel.isHidden = !qLabel.isHidden;
        
    }
    
    @IBAction func didTapBtn(_ sender: Any) {
        qLabel.isHidden = true
        aLabel.isHidden = false
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        currentIndex += 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapPrev(_ sender: Any) {
        currentIndex -= 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    func updateFlashcard(question: String, answer: String, c1: String, c2: String, c3: String) {
        
        let flashcard = Flashcard(question: question,
            answer: answer,
            c1: c1,
            c2: c2,
            c3:c3)
        qLabel.text = flashcard.question
        aLabel.text = flashcard.answer
        btn1.setTitle(flashcard.c1, for: .normal)
        btn2.setTitle(flashcard.c2, for: .normal)
        btn3.setTitle(flashcard.c3, for: .normal)
        flashcards.append(flashcard)
        print(":) added new flashcard")
        print(" \(flashcards.count) in flashcards array")
        
        currentIndex = flashcards.count - 1
        print("current index is \(currentIndex)")
        updateNextPrevButtons()
        save()
    }
    
    func updateNextPrevButtons()
    {
        if currentIndex == flashcards.count - 1
        {
            nextButton.isEnabled = false
        }
        else
        {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0
        {
            prevButton.isEnabled = false
        }
        else
        {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels()
    {
        let currentFlashcard = flashcards[currentIndex]
        
        aLabel.text = currentFlashcard.question
        qLabel.text = currentFlashcard.answer
        btn1.setTitle(currentFlashcard.c1, for: .normal)
        btn2.setTitle(currentFlashcard.c2, for: .normal)
        btn3.setTitle(currentFlashcard.c3, for: .normal)
    }
    
    func save()
    {
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question,
                    "answer": card.answer,
                "c1": card.c1,
                "c2": card.c2,
                "c3": card.c3]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
    }
    
    func read()
    {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]
        {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, c1: dictionary["c1"]!, c2: dictionary["c2"]!, c3: dictionary["c3"]!)
                
            }
            flashcards.append(contentsOf: savedCards)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        read()
        if flashcards.count == 0
        {
            updateFlashcard(question: "Koalas are...", answer: "marsupials", c1: "not real", c2: "insects", c3: "marsupials")
        }
        else
        {
            updateLabels()
            updateNextPrevButtons()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        // Pass the selected object to the new view controller.
        creationController.flashcardsController = self
    }



}

