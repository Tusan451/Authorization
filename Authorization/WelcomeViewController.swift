//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Olegio on 10.08.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var nameTextFieldView: UIView!
    @IBOutlet var passwordTextFieldView: UIView!
    @IBOutlet var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSettings()
    }
    
    // Базовая настройка UI для элементов интерфейса
    private func uiSettings() {
        nameTextFieldView.layer.cornerRadius = 6
        passwordTextFieldView.layer.cornerRadius = 6
        startButton.layer.cornerRadius = 6
    }

    @IBAction func pressedStartButton(_ sender: Any) {
    }
    
}

