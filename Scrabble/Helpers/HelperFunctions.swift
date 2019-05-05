//
//  HelperFunctions.swift
//  Scrabble
//
//  Created by Julio Cesar Aguilar Jimenez on 04/05/2019.
//  Copyright © 2019 Julio C. Aguilar. All rights reserved.
//

import Foundation
import UIKit

//MARK: Initial Setup
// Initial Settings, the app will load this settings on the App Delegate
func setInitialSettings() {
    // Blue color for the navigations bar and white font for titles
    UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.4470588235, green: 0.3411764706, blue: 0.168627451, alpha: 1)
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UIBarButtonItem.appearance().tintColor = UIColor.white
}


// MARK: Extensions
// Hide keyboard when touch outside the field
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
