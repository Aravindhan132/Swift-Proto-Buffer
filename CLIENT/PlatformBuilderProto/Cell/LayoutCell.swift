//
//  LayoutCell.swift
//  PlatformBuilderProto
//
//

import UIKit

class LayoutCell: UITableViewCell {

    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var keyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    func setData(id: String , content: String , key: String) {
        self.idLabel.text = id
        self.contentLabel.text = content
        self.keyLabel.text = key
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
