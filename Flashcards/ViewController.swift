//
//  ViewController.swift
//  Flashcards
//
//  Created by Alex Rankine on 10/13/18.
//  Copyright © 2018 Alex Rankine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        qLabel.isHidden = !qLabel.isHidden;
        aLabel.isHidden = !qLabel.isHidden;
        
    }
    
    @IBAction func didTapBtn(_ sender: Any) {
        qLabel.isHidden = true
        aLabel.isHidden = false
    }
    
    func updateFlashcard(question: String, answer: String, c1: String, c2: String, c3: String) {
        
        qLabel.text = question
        aLabel.text = answer
        btn1.setTitle(c1, for: .normal)
        btn2.setTitle(c2, for: .normal)
        btn3.setTitle(c3, for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

