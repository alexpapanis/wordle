//
//  KeyboardView.swift
//  Wordle
//
//  Created by Alexandre Papanis on 29/12/22.
//

import UIKit

class KeyboardView: UIView {

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var line1StackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var line2StackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var line3StackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension KeyboardView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(line1StackView)
        self.stackView.addArrangedSubview(line2StackView)
        self.stackView.addArrangedSubview(line3StackView)
        
        let line1 = GameManager.shared.keyboard1
        for key in line1 {
            let button = LetterView(letter: key, status: .unused)
            self.line1StackView.addArrangedSubview(button)
        }
        
        let line2 = GameManager.shared.keyboard2
        for key in line2 {
            let button = LetterView(letter: key, status: .unused)
            self.line2StackView.addArrangedSubview(button)
        }
        
        let line3 = GameManager.shared.keyboard3
        for key in line3 {
            let button = LetterView(letter: key, status: .unused)
            self.line3StackView.addArrangedSubview(button)
        }
    }
    
    func setupConstraints() {
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}
