//
//  UIViewController+Ext.swift
//  TWFollowers
//
//  Created by Nahuel Terrazas on 31/01/2023.
//

import UIKit

extension UIViewController {
    func presentATAlertOnMainThread(title: String, message: String, buttonTitle: String){
        
        DispatchQueue.main.async {
            let alertVC = TWAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle   = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}

