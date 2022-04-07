//
//  DetalhesTableViewController.swift
//  ProjetoFilmes
//
//  Created by user213614 on 3/23/22.
//

import UIKit

class DetalhesTableViewController: UITableViewController{
    
    //MARK: - Atributos
    
    var listaFilmes: [String] = []
    
    var filmes: [String] = ["The Batman", "Animais fantasticos", "Django livre", "Star Wars VI", "Harry Potter"]
    
    var diretor: [String] = ["Matt Reeves", "David Yates", "Quentin Tarantino","Richard Marquand", "Chris Columbus"]
    
    var anoLancamento: [String] = ["03/03/2022", "17/11/2016", "18/01/2013","06/10/1983","23/10/2001"]
    
    var duracao: [String] = ["2h 56m","2h 13m","2h 45m","2h 11m","2h 32m"]
    
    var genero: [String] = ["Acao/Aventura", "Fantasia/Aventura", "Faroeste/Drama", "Ficcao cientifica", "Fantasia/Aventura"]
    
//    var detalhes: [Array] = [diretor, anoLancamento, duracao, genero]
    
    //MARK: - Table View Controller
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaFilmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula  = tableView.dequeueReusableCell(withIdentifier: "celulaFilme", for: indexPath)
        
        celula.textLabel?.text = listaFilmes[indexPath.row]
        
        return celula
    }
    
    //MARK: - Alert
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let alerta = UIAlertController(title: filmes[indexPath.row], message: "Diretor: \(diretor[indexPath.row]). Ano de lancamento: \(anoLancamento[indexPath.row]). Duracao: \(duracao[indexPath.row]). Genero: \(genero[indexPath.row])", preferredStyle: .alert)
//
//        let confirma = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
//        let cancela = UIAlertAction(title: "Cancelar" ,style: .destructive, handler: nil)
//
//        alerta.addAction(confirma)
//        alerta.addAction(cancela)
//        present(alerta, animated: true)
    }
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

    //MARK: - edit style
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let filme = FilmeCRUD()
//
//            filme.deletar(index: indexPath.row)
//            listaFilmes = filme.listar()
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
