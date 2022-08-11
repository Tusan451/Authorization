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
    
    private let legalPassword = "12345Hola!"
    private var login = ""
    private var password = ""
    
    
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
        startButton.backgroundColor = UIColor.systemBlue
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
    
    // Предупреждение
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // Сохранение введенных данных
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        switch textField.tag {
        case 0:
            login = text
        case 1:
            password = text
        default:
            break
        }
    }
}

