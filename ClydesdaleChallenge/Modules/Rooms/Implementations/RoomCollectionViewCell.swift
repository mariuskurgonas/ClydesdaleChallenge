//
//  RoomCollectionViewCell.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var isOccupiedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 15
        contentView.layer.cornerRadius = self.layer.cornerRadius
        containerView.layer.cornerRadius = self.contentView.layer.cornerRadius
    }

    func setup(room: Room) {
        nameLabel.text = room.name
        isOccupiedLabel.text = room.isOccupied ? "YES" : "NO"
    }
}
