//
//  ListarTarefasTableViewController.swift
//  ProjetoTarefas
//
//  Created by user213614 on 3/28/22.
//

import UIKit


class e: UITableViewController {
   
    var tarefas: [String] = [ ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //alterar i, valor para uma chave especifico
//        UserDefaults.standard.setValue("Augusto", forKey: "nome")
//        UserDefaults.standard.setValue(tarefas, forKey: "tarefas")

//
//        let tarefasDefaults = UserDefaults.standard.object(forKey: "tarefas")
//        print(tarefasDefaults)
//
//        tarefas = UserDefaults.standard.object(forKey: "tarefas") as! [String]
//        print(tarefas)
        
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        let tarefa = TarefaUtil()
//        tarefas = tarefa.listar()
//        tableView.reloadData()
//        print("viewdidappear")
//    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tarefas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)

        cell.textLabel?.text = tarefas[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
   
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        //mandar para rela de adicionar
        performSegue(withIdentifier: "adicionarTarefas", sender: indexPath.row) //o sender eh o dado que eu quero enviar
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier ==  "adicionarTarefas" {
            //instanciamos o controlador da tela de destino
            let destinoAdd =  segue.destination as! AddTarefaViewController
            
            //setamos o indice do array que devemos alterar no controlador de destino
            //no cenario de adicao, o sender entra como botao, nao sendo possivel converter para Int, assim, tratamos esta conversao com um if, verificando a possibilidade de converter a variavel sender para interiro(apenas no caso de edicao)
            if let i = sender as? Int{
                destinoAdd.indexTarefa = i
            }
        }
       
    }
    
    // Override to support editing the table view.
    //metodo para araastar e deletar
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            let tarefa = TarefaUtil()
            tarefa.deletar(index: indexPath.row)
            tarefas = tarefa.listar()
            tableView.deleteRows(at: [indexPath], with: .fade) //melhor q o reloadData()
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
          }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
