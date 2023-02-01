//
//  ATAlertVC.swift
//  TWFollowers
//
//  Created by Nahuel Terrazas on 31/01/2023.
//

import UIKit

class TWAlertVC: UIViewController {

    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiarySystemBackground
        view.layer.cornerRadius = 16
//        view.layer.borderWidth = 2
//        view.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)

        self.view.addSubview(view)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = TWTitleLabel(textAlignment: .center, fontSize: 20)
        label.text = alertTitle
    
        containerView.addSubview(label)
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = TWBodyLabel(textAlignment: .center)
        label.text = message
        label.numberOfLines = 4
        containerView.addSubview(label)
        return label
    }()
    
    lazy var actionBotton: UIButton = {
        let button = TWButton(title: "Ok")
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        containerView.addSubview(button)
        return button
    }()
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.75)
        setupContraints()
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            actionBotton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            actionBotton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            actionBotton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            actionBotton.heightAnchor.constraint(equalToConstant: 44),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: actionBotton.topAnchor, constant: 8)
        
        ])

    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    

}
