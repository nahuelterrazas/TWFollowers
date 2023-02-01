//
//  ATButton.swift
//  TWFollowers
//
//  Created by Nahuel Terrazas on 30/01/2023.
//

import UIKit

class TWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        var configuration = UIButton.Configuration.borderedTinted()
        configuration.buttonSize = .large
        self.configuration = configuration
    }
}
