//
//  historyTableViewCell.swift
//  Medito
//
//  Created by Student on 11/16/20.
//

import UIKit

class historyTableViewCell: UITableViewCell {

    @IBOutlet weak var historyAudioLbl: UILabel!
    @IBOutlet weak var historyAudioImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
