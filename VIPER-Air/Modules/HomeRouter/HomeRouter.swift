//
//  HomeRouter.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation
import UIKit


protocol HomeRouting {
    
}

class HomeRouter {
    var view: UIViewController
    
    init(view: UIViewController){
        self.view = view
    }
    
}

extension HomeRouter: HomeRouting {
    
}
