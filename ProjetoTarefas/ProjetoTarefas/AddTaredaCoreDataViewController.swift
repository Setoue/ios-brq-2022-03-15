//
//  AddTaredaCoreDataViewController.swift
//  ProjetoTarefas
//
//  Created by user213614 on 3/31/22.
//

import UIKit

class AddTaredaCoreDataViewController: UIViewController {

    @IBAction func botaoCoreData(_ sender: Any) {
    
        let tcu = TarefaCoreDateUtil()
        
        tcu.salvar(descricao: coreDataTextView.text)
        
        navigationController?.popViewController(animated:true)

            }
    
    @IBOutlet weak var coreDataTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
