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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(detalhesFilmes(_:)))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    @objc func detalhesFilmes(_ gesture: UITapGestureRecognizer){
        if gesture.state == .began{
            let viewCell = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: viewCell) else{ return }
            
            lis
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "listarParaAddTarefaCoreDataSegue", sender: indexPath.row)
        
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "listarParaAddTarefaCoreDataSegue"{
            
            let destinoControlador = segue.destination as! AddTaredaCoreDataViewController
            
            guard let i = sender as? Int else{ return }
            destinoControlador.indexTarefa = i
            
            
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tarefa = TarefaCoreDateUtil()
            
            tarefa.deletar(index: indexPath.row)
            listarTarefaModel = tarefa.listar()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: -did Select Rows
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}
