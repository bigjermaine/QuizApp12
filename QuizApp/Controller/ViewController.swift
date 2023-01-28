//
//  ViewController.swift
//  QuizApp
//
//  Created by Apple on 28/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    @IBAction func startgame() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
        
    }
    
}
