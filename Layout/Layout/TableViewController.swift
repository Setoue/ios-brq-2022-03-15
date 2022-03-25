//
//  TableViewController.swift
//  Layout
//
//  Created by user213614 on 3/22/22.
//

import UIKit

class TableViewController: UITableViewController{
    
    var pizza: [String] = ["Mucarela", "Calabreza", "Frango"]
    
    var	 descricaoPizzas = ["Pizza com mucarela e molho de tomate", "Pizza com calabreza, cebola, molho de tomate e oregano", "Pizza com palmito, mucarela e molho de tomate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizza.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)//
        
        celula.textLabel?.text = pizza[indexPath.row] //bota o texto em cada celula
        
        return celula
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(descricaoPizzas[indexPath.row])
        
        let alerta = UIAlertController(title: pizza[indexPath.row], message: descricaoPizzas[indexPath.row], preferredStyle: .alert)
        
        let confirmar = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        let cancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: {
            alert in
            self.pizza.remove(at: indexPath.row)
            self.descricaoPizzas.remove(at: indexPath.row)
            self.tableView.reloadData()
        }) //handler chama uma funcáo como parametro

        
        present(alerta, animated: true, completion: nil)
        alerta.addAction(confirmar)
        alerta.addAction(cancelar)
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     //   segundaTela.navigationController?.popViewController(animated: tru*e)
    }
}
