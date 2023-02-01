//
//  ATTextField.swift
//  TWFollowers
//
//  Created by Nahuel Terrazas on 30/01/2023.
//

import UIKit

class TWTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(placeholder: "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        configure(placeholder: placeholder)
    }
    
    private func configure(placeholder: String) {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        layer.cornerRadius          = 5
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        self.placeholder            = placeholder

        autocorrectionType = .no
        backgroundColor    = .secondarySystemBackground
        returnKeyType      = .search
        autocapitalizationType = .none
    }
    
}
