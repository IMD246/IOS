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
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
