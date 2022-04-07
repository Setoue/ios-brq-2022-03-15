//
//  ViewController.swift
//  ProfessoresAPI
//
//  Created by user213614 on 4/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    var indexListaDaAPI : Int = -1
    
    @IBOutlet weak var botaoOutLet: UIButton!
    var professorAlterado: ProfessorModel?
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textNome: UITextField!
    @IBAction func butaoAdd(_ sender: Any) {
        //edicao
        if let p = professorAlterado{
            edit()
        }
        //salvar
        else {
            save()
        }
       
    }
    func idEdicao() -> Bool{
        return (indexListaDaAPI >= 0 ? true : false )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // so acontece quando eh edicao
        if let p = professorAlterado {
            textNome.text = p.nome
            textEmail.text = p.email
        }
    }
    
    //MARK: - Funcao editar
    func edit(){
        let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores/\(professorAlterado!.id!)")!
        
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PATCH"
        
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let professor = ProfessorModel()
        professor.nome = textNome.text
        professor.email = textEmail.text
        
        //Conversao e atribuir JSON para o corpo da requisicao
        let encoder = JSONEncoder()
        do{
        requisicao.httpBody = try encoder.encode(professor)
        }catch{
            print("erro ao converter professor")
        }
        
        //criar a tarefa assincrona que vai fazer a requisicao
        let tarefa = URLSession.shared.dataTask(with: requisicao){
            (dados, resposta, erro) in
            if (erro == nil){
                print("Professor editado com sucesso")
            } else {
                print("Erro ao editar o professor")
            }
        }
        tarefa.resume()
    }
    
    
    
    //MARK: - Funcao salvar
    func save(){
        let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores")!
        
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let professor = ProfessorModel()
        professor.nome = textNome.text
        professor.email = textEmail.text
        
        //Conversao e atribuir JSON para o corpo da requisicao
        let encoder = JSONEncoder()
        do{
        requisicao.httpBody = try encoder.encode(professor)
        }catch{
            print("erro ao converter professor")
        }
        
        //criar a tarefa assincrona que vai fazer a requisicao
        let tarefa = URLSession.shared.dataTask(with: requisicao){
            (dados, resposta, erro) in
            if (erro == nil){
                print("Professor criado com sucesso")
            } else {
                print("Erro ao criar o professor")
            }
        }
        tarefa.resume()
    }

}

