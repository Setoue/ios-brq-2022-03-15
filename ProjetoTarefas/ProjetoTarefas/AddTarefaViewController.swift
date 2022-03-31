//
//  AddTarefaViewController.swift
//  ProjetoTarefas
//
//  Created by user213614 on 3/28/22.
//

import UIKit

class AddTarefaViewController: UIViewController {

    var indexTarefa: Int = -1
    var textoTarefa: String =  " "
    
    @IBOutlet weak var butaoAdd: UIButton!// outra referencia para poder alterar o texto do botao
    //muito normal reaproveitar a tela
    @IBOutlet weak var textView: UITextView!
    
    //MARK: - Botao adicinoar
    @IBAction func AddTarefaAction(_ sender: Any) {
        
        //pegar o valro salvo na memoria e converte do tipo Any para para um array de String
        //var tarefas = UserDefaults.standard.object(forKey: "tarefas") as! [String]
        
        //pega tarefa digitada pelo usuario
        
        
    //adiconar no final do array de string
        //tarefas.append(tarefa)
        
        //salvar novo array na memoria
        //UserDefaults.standard.setValue(tarefas, forKey: "tarefas")
        
        
        let tarefaU = TarefaUtil()
        
        if isEdicao() == true { //condicoes para dizer q eh edicao
            tarefaU.editar(index: indexTarefa, novaTarefa: textView.text!)
        }
        else {
            tarefaU.salvar(novaTarefa:  textView.text!)
        }
        navigationController?.popViewController(animated:true)
    }

    //MARK: - Depois que a view foi carregada
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = textoTarefa
        
        if isEdicao() == true{
            butaoAdd.setTitle("Editar tarefa", for: .normal)
            
            let tarefaU = TarefaUtil()
            let lista = tarefaU.listar()
            textView.text = lista[indexTarefa]
            
            
        }
        
    }
    
    func isEdicao() -> Bool{//funcao serve pra dizer se eh edicao ou adicao
        // if ternario
        return indexTarefa >= 0 ? true : false
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
