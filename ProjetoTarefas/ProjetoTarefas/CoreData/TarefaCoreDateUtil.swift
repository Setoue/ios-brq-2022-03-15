//
//  TarefaCoreDateUtil.swift
//  ProjetoTarefas
//
//  Created by user213614 on 3/30/22.
//

import Foundation
import UIKit
import CoreData

class TarefaCoreDateUtil: UITableViewController{
    
    func listar() -> [TarefaModel] {
            
        var listaTarefa: [TarefaModel] = []
        
                let context = getContext()
        
                //MARK: -LEitura de dados
                let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Tarefa")
        
                do{
                    let tarefasConsulta = try context.fetch(requisicao)
        
                    for t in tarefasConsulta as! [NSManagedObject]{
                        
//                        print( t.value(forKey: "autor") as! String)
//                        print( t.value(forKey: "descricao") as! String)
//                        print( t.value(forKey: "ja_realizado") as! Int)
                        
                        let tm = TarefaModel()
                        tm.descricao = t.value(forKey: "descricao") as! String
                        tm.autor =  t.value(forKey: "descricao") as! String
                        tm.ja_realizado = t.value(forKey: "ja_realizado") as! Int
                        listaTarefa.append(tm)
        
        
                    }
                }catch{
                    print("Erro ao consultar tarefas")
        }
        return listaTarefa
    }
    //MARK: - Gravar dados
    func salvar(descricao: String){
        
        let context = getContext()
        
        let tarefa = NSEntityDescription.insertNewObject(forEntityName: "Tarefa", into: context)
        
         tarefa.setValue(descricao, forKey: "descricao")
        tarefa.setValue("Augusto", forKey: "autor")
        tarefa.setValue(1, forKey: "ja_realizado")
        
        do{
            try context.save()
        }catch{ //so executa o q ta no catch caso o do nao der certo
            print("Erro ao salvar a tarefa")
        }
    }
    func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let context = appDelegate.persistentContainer.viewContext
        
        return context
    }
    //MARK: -Deletar dados
    func deletar(index: Int) {
        let context = getContext()
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Tarefa")
        
        do{
            //buscar todos os registros do core data do tipo NSManagedObject
            let tarefasConsuta = try context.fetch(requisicao) as! [NSManagedObject]
            
            //deletar do contexto apenas o  registro com o indece do parametro (array definido na linha anterior)
            try context.delete(tarefasConsuta[index])
            
            //atualiza o contexto
            try context.save()
        }catch{
            print("Ërro ao remover tarefa")
        }

        
    }
    //MARK: - Editar dados
    func editar(index: Int, novaTarefa: String){
        let context = getContext()
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Tarefa")
        
        do{
            //buscar todos os registros do core data do tipo NSManagedObject
            let tarefasConsuta = try context.fetch(requisicao) as! [NSManagedObject]
            
            //editar apenas o registro com o indice que de desejo da edicao (altera apenas o atributo em questao)
            tarefasConsuta[index].setValue(novaTarefa, forKey: "descricao")
            
            //atualiza o contexto
            try context.save()
        }catch{
            print("Ërro ao editar tarefa")
        }
    }
}
