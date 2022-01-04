//
//  HomePresenter.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation


protocol HomePresentation {
    func viewDidLoad()
}


class HomePresenter {
    weak var view: HomeView?
    var interactor: HomeUseCase 
    var router: HomeRouting
    
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension HomePresenter: HomePresentation {
  

    func viewDidLoad() {
        print("Works")
        self.interactor.fetchRequest(count: 5) { result in
            switch result {
                
            case .success(data: let data):
                guard let users =  data as? Users, let userData = users.results else {
                    return
                }
                
                self.view?.upDate(dto: userData)
                
            case .failed(error: let error):
                print("Failed \(String(describing: error))")
            }
        }
        
  
    }
    
    
}
