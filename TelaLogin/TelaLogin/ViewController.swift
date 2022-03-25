//
//  ViewController.swift
//  TelaLogin
//
//  Created by user213614 on 3/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dadoEmail: UILabel!
    
    @IBOutlet weak var textLogin: UILabel!
    
    @IBOutlet weak var dadoSenha: UILabel!
    
    @IBOutlet weak var textEmail: UITextField!
    
    @IBOutlet weak var textSenha: UITextField!
    
    @IBAction func butaoEntrar(_ sender: Any) {
        textLogin.text = "Ola, \(textEmail.text!)"
//        dadoEmail.text = dadoEmail.text
//        dadoSenha.text = dadoSenha.text
        print("email: \(textEmail.text!)")
        print("senha: \(textSenha.text!)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

