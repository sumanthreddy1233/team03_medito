//
//  TableViewCell.swift
//  Medito
//
//  Created by Student on 11/11/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var audioView: UIView!
    @IBOutlet weak var audioImg: UIImageView!
    @IBOutlet weak var audioName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
