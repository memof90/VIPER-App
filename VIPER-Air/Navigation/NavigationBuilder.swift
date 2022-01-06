//
//  NavigationBuilder.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 6/1/22.
//

import Foundation
import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        
        navigationController.navigationBar.barTintColor = UIColor.systemBlue
        
        let font = UIFont.systemFont(ofSize: 30)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black
        shadow.shadowBlurRadius = 5
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .shadow: shadow
        ]
        navigationController.navigationBar.titleTextAttributes = attributes
        navigationController.navigationBar.largeTitleTextAttributes = attributes
        navigationController.navigationBar.prefersLargeTitles = true
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = attributes
        appearance.largeTitleTextAttributes = attributes
        navigationController.navigationBar.standardAppearance = appearance;
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance
        
        
        return navigationController
    }
}
