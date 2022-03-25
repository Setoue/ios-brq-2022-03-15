//
//  ViewController.swift
//  Layout
//
//  Created by user213614 on 3/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usuarioTextField: UITextField?
    
    @IBOutlet weak var senhaTextField: UITextField?
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginParaSegundaTelaSegue" {
            var segundaTela = segue.destination as! SegundaTelaViewController
        
            guard let usuario = usuarioTextField?.text, let senha = senhaTextField?.text else { return }
        
            segundaTela.usuarioValue = "Usuario: \(usuario)"
            segundaTela.senhaValue = "Senha: \(senha)"
        }
//        else if segue.identifier == "loginParaTableViewController" {
//            var tableView = segue.destination as! TableViewController
//        }
        
    }

}

