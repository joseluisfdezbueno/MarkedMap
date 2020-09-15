//
//  UIViewController+Extensions.swift
//  MarkedMap
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showDefaultAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "default_error_alert_title".localized(), message: "default_error_alert_message".localized(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "accept".localized(), style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
        
}
