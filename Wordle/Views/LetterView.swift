//
//  LetterViewCell.swift
//  Wordle
//
//  Created by Alexandre Papanis on 27/12/22.
//

import UIKit

protocol LetterDelegate: NSObjectProtocol {
    func letterPressed(letter: String)
}

extension LetterDelegate {
    func letterPressed(letter: String){}
}

enum LetterStatusEnum {
    case unused
    case used
    case wrongPosition
    case rightPosition
}

class LetterView: UIView {
    
    private lazy var letterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var letter: String = ""
    var status: LetterStatusEnum = .unused {
        didSet {
            self.configColors(status: status)
        }
    }
    
    init(letter: String, status: LetterStatusEnum) {
        super.init(frame: .zero)
        self.addSubview(letterButton)
        self.letterButton.setTitle(letter, for: .normal)
        self.letterButton.layer.cornerRadius = 8
        self.letter = letter
        self.status = status
        self.configColors(status: status)
    }
    
    private func configColors(status: LetterStatusEnum?) {
        switch status {
        case .unused:
            self.letterButton.backgroundColor = .white
            self.letterButton.setTitleColor(.black, for: .normal)
        case .used:
            self.letterButton.backgroundColor = .gray
            self.letterButton.setTitleColor(.white, for: .normal)
        case .wrongPosition:
            self.letterButton.backgroundColor = .yellow
            self.letterButton.setTitleColor(.white, for: .normal)
        case .rightPosition:
            self.letterButton.backgroundColor = .green
            self.letterButton.setTitleColor(.white, for: .normal)
        case .none:
            break
        }
    }

    @objc func buttonPressed() {
        if GameManager.shared.word.contains(self.letter) {
            self.status = .rightPosition
        } else {
            self.status = .used
        }
    }
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
