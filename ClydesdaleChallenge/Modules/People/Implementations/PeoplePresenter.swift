//
//  PeoplePresenter.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 14/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class PeoplePresenter: PeoplePresenting {
    var peopleDataSource: PeopleDataSource?
    
    var navigator: PeopleNavigating?
    
    var peopleService: PeopleService?
    
    weak var view: PeopleViewing?
    
    func updateData() {
        // Data source has to be set
        guard let dataSource = peopleDataSource else {
            assert(false)
            return
        }
        
        peopleService?.cancel()
        peopleService?.requestPeopleList(with: { (people, error) in
            if let people = people {
                let sortedPeople = people.sorted(by: { (p1, p2) -> Bool in
                    return p1.firstName < p2.firstName
                })
                dataSource.data.value = sortedPeople
            }
            else {
                // TODO: HANDLE ERROR AND SHOW MESSAGE
            }
        })
    }
    
    func didSelectItemAt(index: Int) {
        // Data source has to be set
        guard let dataSource = peopleDataSource else {
            assert(false)
            return
        }
        let aPerson = dataSource.data.value[index]
        
        navigator?.showDetails(of: aPerson)
    }
    
    func viewDidLoad() {
        view?.showLoading()
        updateData()
    }
}
