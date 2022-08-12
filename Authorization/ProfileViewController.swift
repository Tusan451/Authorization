//
//  ProfileViewController.swift
//  Authorization
//
//  Created by Olegio on 10.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var exitButton: UIButton!
    @IBOutlet var helloText: UILabel!
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloText.text = "Nice to meet you, \(userName)!"
        exitButton.layer.cornerRadius = 6
    }
}
