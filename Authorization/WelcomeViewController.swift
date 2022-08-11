//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Olegio on 10.08.2022.
//

import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var nameTextFieldView: UIView!
    @IBOutlet var passwordTextFieldView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSettings()
        textFieldsDelegate()
    }
    
    @IBAction func actionButton() {
    }
    
    // Базовая настройка UI для элементов интерфейса
    private func uiSettings() {
        nameTextFieldView.layer.cornerRadius = 6
        passwordTextFieldView.layer.cornerRadius = 6
        startButton.layer.cornerRadius = 6
    }
    
    // Делаем View Controller делегатом протокола UITextFieldDelegate
    private func textFieldsDelegate() {
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Скрытие клавиатуры по нажатию на Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу на экране
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

