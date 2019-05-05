//
//  ViewController.swift
//  Scrabble
//
//  Created by Julio Cesar Aguilar Jimenez on 04/05/2019.
//  Copyright © 2019 Julio C. Aguilar. All rights reserved.
//

import UIKit

class ScrabbleViewController: UIViewController {
    
    private var ScrabbleViewModel = Scrabble(word: nil)
    
    // Initialise the binding
    @IBOutlet weak var wordToScoreTextField: BindingTextField! {
        didSet {
            wordToScoreTextField.bind { (text) in
                self.ScrabbleViewModel.updateWord(word: text)
                self.scoreLabel.text = String(self.ScrabbleViewModel.score)
            }
        }
    }
    @IBOutlet weak var scoreLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Enabling the large title feature
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Dismiss the keyboard when touch anywhere outside the textField
        self.hideKeyboardWhenTappedAround()
    }
    

}

