//
//  ExtViewCell.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 4/1/22.
//

import Foundation
import UIKit


extension UITableViewCell {
    func configureShadow(view: UIView) {
        view.layer.cornerRadius = 8.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.cornerRadius = 8.0
        view.layer.shadowOpacity = 0.6
    }
}
