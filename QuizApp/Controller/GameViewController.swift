//
//  GameViewController.swift
//  QuizApp
//
//  Created by Apple on 28/01/2023.
//

import UIKit

class GameViewController: UIViewController {

         
        @IBOutlet var label:UILabel!
        @IBOutlet var table:UITableView!
        var gameModel = [Question]()
        var currentquestion:Question?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupquestion()
            // Do any additional setup after loading the view.
            configure(question: gameModel.first!)
        }
        
        
  
        private func checkanswer(answer:Answer, question:Question) -> Bool {
            return question.answers.contains(where: {$0.text == answer.text}) && answer.correct
        }
        
        private func configure(question:Question) {
            label.text = question.text
            currentquestion = question
            table.delegate  =  self
            table.dataSource = self
            
        }
        private func setupquestion() {
            gameModel.append(contentsOf: [Question(text: "whats the name of the president of America? ", answers: [ Answer(text: "Biden" ,correct: true),
                 Answer(text: "Buhari", correct:false),
                 Answer(text: "Putin" ,correct:false)
            ]),Question(text: "whats the name of the president of Nigeria? ", answers: [ Answer(text: "Biden" ,correct: false),
               Answer(text: "Buhari", correct:true),
              Answer(text: "Putin" ,correct:false)
    ])  ,Question(text: "who is fatest man to ever live? ",        answers: [ Answer(text: "Bolt" ,correct: true),
        Answer(text: "Gale", correct:false),
        Answer(text: "Powell" ,correct:false)])])
            
        }
    }
extension GameViewController: UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            currentquestion?.answers.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = currentquestion?.answers[indexPath.row].text
            return cell
            
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            
            ///check if answers = current questions answers
            guard let answers = currentquestion?.answers[indexPath.row] else {return}
            ///check if question = current question
            guard let question = currentquestion else {return}
            if  checkanswer(answer:  answers, question:  question) {
                ///get  the current index
                if let index = gameModel.firstIndex(where:{ $0.text == question.text}) {
                ///Next question analysis
                    if index < (gameModel.count - 1 ){
                        
                        let nextquestion = gameModel[index+1]
                        configure(question: nextquestion)
                        tableView.reloadData()
                    }else {
                        let alert = UIAlertController(title: "Game over",
                    message: "game ended", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
                    present(alert, animated: true)
                    }
                }
            }else {
                
                let alert = UIAlertController(title: "wrong", message: "you can do better", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
                present(alert, animated: true)
          }
        }
        
        
        
    }
