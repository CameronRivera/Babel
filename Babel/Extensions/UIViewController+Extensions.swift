//
//  UIViewController+Extensions.swift
//  Babel
//
//  Created by Cameron Rivera on 12/30/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

extension UIViewController{
    func showAlert(_ title: String, _ message: String, completion: ((UIAlertAction) ->())? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: completion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
