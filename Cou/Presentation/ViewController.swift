//
//  ViewController.swift
//  Counter
//
//  Created by Ranis Galiev on 08.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var counterTitleLabel: UILabel!
    @IBOutlet weak var counterBackgroundView: UIView!
    
    // MARK: Variables
    private var counter = 0 {
        didSet {
            counterLabel.text = "\(counter)"
        }
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Стилистические настройки
        counterBackgroundView.layer.cornerRadius = 32
        
        historyTextView.layer.cornerRadius = 24
        historyTextView.layer.masksToBounds = true
        
        counterTitleLabel.text = counterTitleLabel.text?.uppercased()
    }
    
    // MARK: Actions
    @IBAction func decreaseButtonDidTap(_ sender: Any) {
        if counter > 0 {
            addToHistory(text: "\nDATE: значение изменено на -1")
            counter -= 1
        } else {
            addToHistory(text: "\nDATE: попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func increaseButtonDidTap(_ sender: Any) {
        addToHistory(text: "\nDATE: значение изменено на +1")
        counter += 1
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        if counter > 0 {
            addToHistory(text: "\nDATE: значение сброшено")
            counter = 0
        }
    }
    
    // MARK: Functions
    private func addToHistory(text: String) {
        historyTextView.text.append(text)
    }
}

