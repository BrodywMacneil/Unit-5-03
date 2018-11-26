

// Created on: Nov 2018
// Created by: Brody MacNeil
// Created for: ICS3U
// This program generates numbers then finds lowest

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    
    let numbersLabel = UILabel()
    let checkButton = UIButton()
    let answerLabel = UILabel()
    var numbers : [Int] = []
    
    @objc func printLowest() {
        // print lowest number
        answerLabel.text = "The lowest number is: \(checkLowestNumber(numbersSent: numbers))"
    }
    
    @objc func checkLowestNumber(numbersSent : [Int]) -> Int {
        // get lowest number
        var lowestNumber = numbers[0]
        for numberValue in numbers {
            // check if next number is lower
            if lowestNumber > numberValue {
                lowestNumber = numberValue
            }
        }
        
        return lowestNumber
    }
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        for counter in 1 ... 10 {
            var randomNumber : Int = Int(arc4random_uniform(100) + 1 )
            numbers.append(randomNumber)
        }
        
        numbersLabel.text = "Your numbers are: \(numbers)"
        view.addSubview(numbersLabel)
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
        numbersLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        numbersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        checkButton.setTitle("Check", for: UIControl.State.normal)
        checkButton.setTitleColor(.blue, for: .normal)
        checkButton.addTarget(self, action: #selector(printLowest), for: .touchUpInside)
        view.addSubview(checkButton)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.leadingAnchor.constraint(equalTo: numbersLabel.centerXAnchor, constant: 20).isActive = true
        checkButton.topAnchor.constraint(equalTo: numbersLabel.bottomAnchor, constant: 20).isActive = true
        
        answerLabel.text = nil
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
