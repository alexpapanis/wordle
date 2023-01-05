//
//  CodeView.swift
//  Wordle
//
//  Created by Alexandre Papanis on 05/01/23.
//

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func buildViewHierarchy() {}
    func setupConstraints() {}
    func setupAdditionalConfiguration() {} 
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
