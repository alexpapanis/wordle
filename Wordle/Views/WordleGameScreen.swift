//
//  WordleGameScreen.swift
//  Wordle
//
//  Created by Alexandre Papanis on 05/01/23.
//

import UIKit



class WordleGameScreen: UIView {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemPink
        return stack
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private lazy var wordsView: WordsView = {
        let view = WordsView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var keyboardView: KeyboardView = {
        let view = KeyboardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension WordleGameScreen: CodeView {
    func buildViewHierarchy() {
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(titleView)
        self.stackView.addArrangedSubview(wordsView)
        self.stackView.addArrangedSubview(keyboardView)
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        self.stackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        self.titleView.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 0).isActive = true
        self.titleView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 8).isActive = true
        self.titleView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -8).isActive = true
        
        self.wordsView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 8).isActive = true
        self.wordsView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -8).isActive = true
        self.wordsView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 8).isActive = true
        self.wordsView.bottomAnchor.constraint(equalTo: self.keyboardView.topAnchor, constant: 8).isActive = true
        
        self.keyboardView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 8).isActive = true
        self.keyboardView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -8).isActive = true
        self.keyboardView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 0).isActive = true
        self.keyboardView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}

extension WordleGameScreen: WordDelegate {
    func input(letter: String) {
        
    }
}
