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
    

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        qLabel.isHidden = !qLabel.isHidden;
        aLabel.isHidden = !qLabel.isHidden;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

