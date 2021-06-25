//
//  ViewTableViewCell.swift
//  DesignAppFood
//
//  Created by CNTT on 5/24/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    //Mark: Properties
    
    @IBOutlet weak var RankPosition: UILabel!
    @IBOutlet weak var RankImage: UIImageView!
    @IBOutlet weak var RankName: UILabel!
    @IBOutlet weak var RankScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RankImage.layer.cornerRadius = RankImage.frame.size.width / 2
        RankImage.clipsToBounds = true
        RankImage.layer.borderColor = UIColor.lightGray.cgColor
        RankImage.layer
            .borderWidth = 1
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
