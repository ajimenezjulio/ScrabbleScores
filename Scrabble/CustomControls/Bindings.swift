//
//  Bindings.swift
//  Scrabble
//
//  Created by Julio Cesar Aguilar Jimenez on 04/05/2019.
//  Copyright © 2019 Julio C. Aguilar. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = {_ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // Set the closure
    func bind(callback: @escaping (String) -> () ) {
        self.textChangeClosure = callback
    }
    
    // Add a target to our text field so it will call a function every time the text is changed
    private func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    // Trigger the closure, so we can bind it later to our view
    @objc func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            self.textChangeClosure(text)
        }
    }
}
