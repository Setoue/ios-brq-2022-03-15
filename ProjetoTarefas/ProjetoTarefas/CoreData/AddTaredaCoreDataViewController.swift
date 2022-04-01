//
//  AddTaredaCoreDataViewController.swift
//  ProjetoTarefas
//
//  Created by user213614 on 3/31/22.
//

import UIKit

class AddTaredaCoreDataViewController: UIViewController {

    var indexTarefa : Int = -1
    
    @IBOutlet weak var botaoCoreDataOutlet: UIButton!
    
    @IBOutlet weak var textViewCoreData: UITextView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func botaoCoreData(_ sender: Any) {
    
        let tcu = TarefaCoreDateUtil()
            
        if isEdicao() == true { //condicoes para dizer q eh edicao
            tcu.editar(index: indexTarefa, novaTarefa: textViewCoreData.text!)
        }
        else {
            tcu.salvar(descricao:  textViewCoreData.text!)
        }
        
        navigationController?.popViewController(animated:true)
        
        
    }
    @IBOutlet weak var coreDataTextView: UITextView!
    

    
    func isEdicao() -> Bool {
        return (indexTarefa >= 0 ? true : false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (isEdicao()){
            let tarefaU = TarefaCoreDateUtil()
            
            let tarefas = tarefaU.listar()
            
            textViewCoreData.text = tarefas[indexTarefa].descricao
            
            botaoCoreDataOutlet.setTitle("Editar", for: .normal)
            textLabel.text = "Editar tarefa"
            
            
        }
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
