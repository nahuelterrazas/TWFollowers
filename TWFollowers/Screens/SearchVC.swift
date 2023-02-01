//
//  SearchVC.swift
//  ATFollowers
//
//  Created by Nahuel Terrazas on 29/01/2023.
//

import UIKit

class SearchVC: UIViewController {
    
    lazy var imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 100
        imageView.backgroundColor = .systemBlue.withAlphaComponent(0.4)
        imageView.image = UIImage(named: "Spy")
        imageView.sizeToFit()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        return imageView
    }()
    
    lazy var usernameTextField:UITextField = {
        let textField = TWTextField(placeholder: "Enter a username")
        textField.delegate = self

        view.addSubview(textField)
        return textField
    }()
    
    lazy var callToActionButton: UIButton = {
        let button = TWButton(title: "Get followers")
        button.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        
        view.addSubview(button)
        return button
    }()
  
    var isUsernameEntered: Bool { !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupConstraints()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowersListVC(){
        guard isUsernameEntered else {
            presentATAlertOnMainThread(title: "Empty username", message: "Please enter a valid Twitter username to look for", buttonTitle: "Ok")
            return
            }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageLogo.heightAnchor.constraint(equalToConstant: view.frame.width/2),
            imageLogo.widthAnchor.constraint(equalToConstant: view.frame.width/2),
            imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 100),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 55),
            usernameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -75),
            callToActionButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            callToActionButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20)
        ])
    }
}

extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
