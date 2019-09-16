//
//  PeopleDataSource.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class PeopleDataSource : GenericDataSource<Person>, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.reuseIdentifier(), for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        
        // Setup cell with a display item
        cell.setup(with: data.value[indexPath.row])
        
        return cell
    }
}
