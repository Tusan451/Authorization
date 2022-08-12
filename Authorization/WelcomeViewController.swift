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
    
    private let legalPassword = "12345"
    private var login = ""
    private var password = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSettings()
        textFieldsDelegate()
    }
    
    @IBAction func actionButton() {
        if password == legalPassword && login.count > 1 {
            performSegue(withIdentifier: "successSegue", sender: nil)
        } else if password != legalPassword && login != "" {
            showAlert(title: "Не верный пароль", message: "Если вы забыли пароль, нажмите \"Forgot Password\"")
            
            passwordTextFieldView.layer.borderWidth = 2
            passwordTextFieldView.layer.borderColor = UIColor.systemRed.cgColor
            passwordTextField.text = ""
        } else if login.count < 2 && password != "" {
            showAlert(title: "Неправильное имя пользователя", message: "Имя пользователя должно содержать хотя бы 2 символа")
            
            nameTextFieldView.layer.borderWidth = 2
            nameTextFieldView.layer.borderColor = UIColor.systemRed.cgColor
            nameTextField.text = ""
        } else if password == "" && login == "" {
            showAlert(title: "Введите имя пользователя и пароль", message: "")
        }
    }
    
    @IBAction func actionForgotPassword() {
        showAlert(title: "Ваш новый пароль", message: "\(legalPassword)")
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
        login = ""
        password = ""
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
    
    // Переключение полей ввода текста по нажатию на Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
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
            nameTextFieldView.layer.borderWidth = 0
        case 1:
            password = text
            passwordTextFieldView.layer.borderWidth = 0
        default:
            break
        }
    }
    
    // Активное состояние Text Field
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            nameTextFieldView.layer.borderWidth = 2
            nameTextFieldView.layer.borderColor = UIColor.systemBlue.cgColor
        case 1:
            passwordTextFieldView.layer.borderWidth = 2
            passwordTextFieldView.layer.borderColor = UIColor.systemBlue.cgColor
        default:
            break
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profileVC = segue.destination as? ProfileViewController else { return }
        profileVC.userName = login
    }
}

