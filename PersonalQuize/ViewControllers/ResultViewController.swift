//
//  ResultViewController.swift
//  PersonalQuize
//
//  Created by Юрий Скворцов on 23.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var chosenAnswers: [Answer]!
    
    private var results: [Animal : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        calculateResult(for: chosenAnswers)
    }
    
    private func calculateResult(for answers: [Answer]) {
        var countOfMatches = 1
        for answer in answers {
            if !results.keys.contains(answer.animal) {
                results[answer.animal] = countOfMatches
            } else {
                countOfMatches += 1
                results[answer.animal] = countOfMatches
            }
        }
        let sortedResults = results.sorted{ $0.value > $1.value }
        guard let result = sortedResults.first?.key else { return }
        
        getResult(from: result)
    }
    
    private func getResult(from result: Animal) {
        resultLabel.text = "Вы - \(result.rawValue)"
        definitionLabel.text = result.definition
    }
}
