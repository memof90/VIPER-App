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
    
//    MARK: - IBoutlet
    
    @IBOutlet weak var tableView: UITableView!
    
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
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UsersTableView")
        configureCell()
        RegisterNibCells()
        
    }
    
  


}

extension HomeViewController: HomeView {
  
    func upDate(dto: [UserResult]) {
        DispatchQueue.main.async {
            self.userData = dto
            self.tableView.reloadData()
        }
//        userData = dto
        
        userData.forEach { (user) in
            if let userMail = user.email {
                print(userMail)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func configureCell() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func RegisterNibCells() {
        tableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
//        cell.nameLbl.text = userData[indexPath.row].email
        cell.configureCell(user: userData[indexPath.row], index: indexPath.row + 1)
        return cell
    }
    
    
}
