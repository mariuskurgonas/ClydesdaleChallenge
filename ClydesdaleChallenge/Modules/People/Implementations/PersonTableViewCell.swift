//
//  PersonTableViewCell.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit
import SDWebImage

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(with person: Person) {
        avatarImageView.sd_setImage(with: URL(string: person.avatar), placeholderImage: UIImage(named: "person_placeholder"), options: SDWebImageOptions.allowInvalidSSLCertificates, context: nil)
        fullNameLabel.text = person.firstName + " " + person.lastName
        jobTitleLabel.text = person.jobTitle
    }
    
}
