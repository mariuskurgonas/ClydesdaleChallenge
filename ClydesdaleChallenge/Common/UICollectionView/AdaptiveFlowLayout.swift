//
//  AdaptiveFlowLayout.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class AdaptiveFlowLayout : UICollectionViewFlowLayout {
    
    var display : CollectionDisplay = .list {
        didSet {
            if display != oldValue {
                self.invalidateLayout()
            }
        }
    }
    
    var containerWidth: CGFloat = 0.0 {
        didSet {
            if containerWidth != oldValue {
                self.invalidateLayout()
            }
        }
    }
    
    convenience init(display: CollectionDisplay, containerWidth: CGFloat) {
        self.init()
        
        self.display = display
        self.containerWidth = containerWidth
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
        self.configLayout()
    }
    
    func configLayout() {
        switch display {
        case .inline:
            self.scrollDirection = .horizontal
            self.itemSize = CGSize(width: containerWidth * 0.9, height: 300)
            
        case .grid(let column):
            self.scrollDirection = .vertical
            let spacing = CGFloat(column - 1) * minimumLineSpacing
            let optimisedWidth = (containerWidth - spacing) / CGFloat(column)
            self.itemSize = CGSize(width: optimisedWidth , height: optimisedWidth) // keep as square
            
        case .list:
            self.scrollDirection = .vertical
            self.itemSize = CGSize(width: containerWidth, height: 130)
        }
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        self.configLayout()
    }
}
