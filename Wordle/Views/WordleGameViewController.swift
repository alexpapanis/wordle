//
//  WordleGameViewController.swift
//  Wordle
//
//  Created by Alexandre Papanis on 27/12/22.
//

import UIKit

class WordleGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = WordleGameScreen()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let path = Bundle.main.path(forResource: "palavras", ofType: "txt")
        do {
            let content = try NSString.init(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
            var words: [String] = []
            words = content.components(separatedBy: "\n")
            let words5 = words.filter { $0.count == 5 }
            print(words5)
        } catch {
            print(error)
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



