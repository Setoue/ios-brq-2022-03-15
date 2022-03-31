//
//  TarefaUtil.swift
//  ProjetoTarefas
//
//  Created by user213614 on 3/28/22.
//

import Foundation

class TarefaUtil{ //class dedicada a manipular as tarefas na memoria.
    
    let chave = "tarefas"
    
    func listar() -> [String]{
    
    let tarefas = UserDefaults.standard.object(forKey: chave)
    
    if tarefas == nil{
        return []
    }

    print(tarefas)
    
    return(tarefas as! [String])
    }

    func salvar(novaTarefa: String){
    
        var tarefas = listar()
        
        tarefas.append(novaTarefa)
        
        UserDefaults.standard.setValue(tarefas, forKey: chave)
    
    }

    func deletar(index: Int){
        var tarefas = listar()
        print(tarefas)
        print(index)
        tarefas.remove(at: index)
        UserDefaults.standard.setValue(tarefas, forKey: chave)

    }
    
    func editar(index: Int, novaTarefa: String){
        
        var tarefas = listar()
        
        tarefas[index] = novaTarefa
        
        UserDefaults.standard.setValue(tarefas, forKey: chave)
    }
}

