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
        historyTextView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        counterTitleLabel.text = counterTitleLabel.text?.uppercased()
    }
    
    // MARK: Actions
    @IBAction func decreaseButtonDidTap(_ sender: Any) {
        if counter > 0 {
            addToHistory(text: "значение изменено на -1")
            counter -= 1
        } else {
            addToHistory(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func increaseButtonDidTap(_ sender: Any) {
        addToHistory(text: "значение изменено на +1")
        counter += 1
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        addToHistory(text: "значение сброшено")
        if counter > 0 {
            counter = 0
        }
    }
    
    // MARK: Functions
    private func addToHistory(text: String) {
        historyTextView.text.append("\n\(Date().dateTimeString): " + text)
        scrollToBottom(historyTextView)
    }
    
    private func scrollToBottom(_ textView: UITextView) {
        guard textView.text.count > 0 else { return }
        let bottomRange = NSRange(location: textView.text.count - 1, length: 1)
        textView.scrollRangeToVisible(bottomRange)
    }
}

