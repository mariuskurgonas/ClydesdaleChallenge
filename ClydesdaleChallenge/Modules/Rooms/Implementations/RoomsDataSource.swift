//
//  RoomsDataSource.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class RoomsDataSource : GenericDataSource<Room>, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomCollectionViewCell.reuseIdentifier(), for: indexPath) as? RoomCollectionViewCell else {
            assert(false)
            return UICollectionViewCell()
        }
        
        cell.setup(room: data.value[indexPath.row])
        return cell
    }
}
