//
//  ViewController.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import UIKit

protocol HomeView: AnyObject {
    func upDate(dto: [UserResult])
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenter? {
        didSet {
            self.presenter?.viewDidLoad()
        }
    }
    
    
    var userData: [UserResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter?.viewDidLoad()
        
    }


}

extension HomeViewController: HomeView {
  
    func upDate(dto: [UserResult]) {
        userData = dto
        
        userData.forEach { (user) in
            if let userMail = user.email {
                print(userMail)
            }
        }
    }
    
   
    
    
}
