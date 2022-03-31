//
//  TarefaCoreDataViewController.swift
//  ProjetoTarefas
//
//  Created by user213614 on 3/30/22.
//


import UIKit
import CoreData

class TarefaCoreDataViewController : UITableViewController{
    
    var tarefaCoreData = TarefaCoreDateUtil()
    var listarTarefaModel: [TarefaModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listarTarefaModel = tarefaCoreData.listar()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listarTarefaModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coreReuso", for: indexPath)
        cell.textLabel?.text = listarTarefaModel[indexPath.row].descricao //náo quero o objeto e sim o atibuto descricao
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tarefa = TarefaCoreDateUtil()
            listarTarefaModel = tarefa.deletar(index: indexPath.row, lista: listarTarefaModel)
            
//            listarTarefaModel = tarefaCoreData.listar()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
