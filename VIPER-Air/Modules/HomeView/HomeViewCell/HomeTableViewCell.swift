//
//  HomeTableViewCell.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 4/1/22.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
//    MARK: -IBoutlet
    
    @IBOutlet weak var HomeImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var ageLbl: UILabel!
    
    @IBOutlet weak var mView: UIView!
    //     MARK: - Identifier
    static let identifier = String(describing: HomeTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureShadow(view: mView)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(user: UserResult, index: Int) {
        guard let name = user.name?.first, let lastName = user.name?.last, let gender = user.gender, let age = user.dob?.age, let imageMedium = user.picture?.medium else {return}
        self.nameLbl.text = "\(index). \(name) \(lastName)"
        self.genderLbl.text =  gender
        self.ageLbl.text = "Edad: \(age)"
        
        loadImage(nameImage: imageMedium)
        
    }
    
    func loadImage(nameImage: String) {
        let url = URL(string: nameImage)
        let processor = DownsamplingImageProcessor(size: HomeImage.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        HomeImage.kf.indicatorType = .activity
        HomeImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
    override func prepareForReuse() {
        self.nameLbl.text = nil
        self.HomeImage.image = nil
        self.genderLbl.text = nil
        self.ageLbl.text = nil
        
    }
 
    
}
