//
//  ViewController.swift
//  MeuSegundoProjeto
//
//  Created by user213614 on 3/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recebeNome: UITextField!
    
    @IBOutlet weak var antesDeClicar: UILabel!
    
    @IBAction func Adicionar(_ sender: Any) {
        print("Deu Certo!!")
        let nome = recebeNome.text
        print(nome!)
        antesDeClicar.text = nome //alterando o texto atraves de uma acao
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

