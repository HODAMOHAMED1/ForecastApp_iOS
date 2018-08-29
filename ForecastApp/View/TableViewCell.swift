//
//  TableViewCell.swift
//  ForecastApp
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dayname: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var lowtemp: UILabel!
    @IBOutlet weak var hightemp: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
