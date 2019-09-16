//
//  PersonDetailViewController.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit
import SDWebImage
import HEXColor

class PersonDetailViewController: UIViewController {

    var person: Person? {
        didSet {
            setupView()
        }
    }
    
    @IBOutlet weak var defaultOverlayView: UIView!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var colorImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Person details"

        setupView()
    }
    
    func setupView() {
        if let person = person, isViewLoaded {
            if !defaultOverlayView.isHidden {
                UIView.animate(withDuration: 0.25, animations: { [weak self] in
                    self?.defaultOverlayView.alpha = 0
                }) { [weak self] (success) in
                    self?.defaultOverlayView.isHidden = true
                }
            }
            
            let fullName = person.firstName + " " + person.lastName
            
            title = fullName
            avatarImageView.sd_setImage(with: URL(string: person.avatar), placeholderImage: UIImage(named: "person_placeholder"), options: SDWebImageOptions.allowInvalidSSLCertificates, context: nil)
            avatarImageView.accessibilityLabel = "Avatar image of \(fullName)"
            emailLabel.text = person.email
            emailLabel.accessibilityLabel = person.email
            phoneLabel.text = person.phone
            phoneLabel.accessibilityLabel = person.phone
            jobTitleLabel.text = person.jobTitle
            jobTitleLabel.accessibilityLabel = person.jobTitle
            colorImageView.image = UIImage(named: "circle")?.sd_tintedImage(with: UIColor(person.favouriteColour))
        }
    }
}

// UISplitViewController support when collapsing detain onto master
extension PersonDetailViewController: HasContentProtocol {
    func hasContent() -> Bool {
        return person != nil
    }
}
