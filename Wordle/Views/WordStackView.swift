//
//  WordStackView.swift
//  Wordle
//
//  Created by Alexandre Papanis on 05/01/23.
//

import UIKit

class WordStackView: UIView {
        
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var word: [String] = []
    var delegate: WordDelegate!
    
    init(delegate: WordDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func input(letter: String) {
        print("Letter added: \(letter)")
        self.word.append(letter)
    }
    
    func remove() {
        print("Letter removed: \(self.word.popLast() ?? "")")
    }
    
}

extension WordStackView: CodeView {
    func setupAdditionalConfiguration() {
        self.stackView.backgroundColor = .yellow
    }
}
