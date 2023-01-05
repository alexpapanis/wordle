//
//  WordsView.swift
//  Wordle
//
//  Created by Alexandre Papanis on 30/12/22.
//

import Foundation
import UIKit


protocol WordDelegate: NSObjectProtocol {
    func input(letter: String)
    func remove()
}

extension WordDelegate {
    func input(letter: String){}
    func remove(){}
}

class WordsView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var line1StackView: WordStackView = {
        return WordStackView(delegate: self.delegate)
    }()
    
    private lazy var line2StackView: WordStackView = {
        return WordStackView(delegate: self.delegate)
    }()
    
    private lazy var line3StackView: WordStackView = {
        return WordStackView(delegate: self.delegate)
    }()
    
    private lazy var line4StackView: WordStackView = {
        return WordStackView(delegate: self.delegate)
    }()
    
    private lazy var line5StackView: WordStackView = {
        return WordStackView(delegate: self.delegate)
    }()
    
    private lazy var line6StackView: WordStackView = {
        return WordStackView(delegate: self.delegate)
    }()
    
    var delegate: WordDelegate!
    
    init(delegate: WordDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension WordsView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(line1StackView)
        self.stackView.addArrangedSubview(line2StackView)
        self.stackView.addArrangedSubview(line3StackView)
        self.stackView.addArrangedSubview(line4StackView)
        self.stackView.addArrangedSubview(line5StackView)
        self.stackView.addArrangedSubview(line6StackView)
    }
    
    func setupConstraints() {
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
}
