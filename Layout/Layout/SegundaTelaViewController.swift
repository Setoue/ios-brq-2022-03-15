//
//  SegundaTelaViewController.swift
//  Layout
//
//  Created by user213614 on 3/21/22.
//

import UIKit

class SegundaTelaViewController: UIViewController{
    
    var usuarioValue: String?
    var senhaValue: String?
    
    @IBOutlet weak var usuarioSegundaTela: UILabel!
    
    @IBOutlet weak var senhaSegundaTela: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuarioSegundaTela.text = usuarioValue
        senhaSegundaTela.text = senhaValue
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     //   segundaTela.navigationController?.popViewController(animated: true)
    }
}
