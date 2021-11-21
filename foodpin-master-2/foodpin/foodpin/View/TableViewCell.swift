//
//  TableViewCell.swift
//  foodpin
//
//  Created by 張宸瑋 on 2021/11/1.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    @IBOutlet var thumbnailImageView: UIImageView!{
        didSet{
    
            thumbnailImageView.layer.cornerRadius = 60
            thumbnailImageView.clipsToBounds = true
            thumbnailImageView.layer.borderWidth = 2
            
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the sselected state
    }
    
}
