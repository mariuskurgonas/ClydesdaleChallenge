//
//  ThemeManager.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

enum Theme: Int {
    case theme1
    
    var mainColor: UIColor {
        switch self {
        case .theme1:
            return UIColor("#C40202")
        }
    }
}

let SelectedThemeKey = "SelectedTheme"

class ThemeManager {
    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: SelectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        }
        else {
            return .theme1
        }
    }
    
    static func applyTheme(theme: Theme) {
        // First persist the selected theme using NSUserDefaults.
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
        
        UINavigationBar.appearance().tintColor = theme.mainColor
        UINavigationBar.appearance().backgroundColor = .gray
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : theme.mainColor]
        UITabBar.appearance().tintColor = theme.mainColor
        UIRefreshControl.appearance().tintColor = theme.mainColor
    }
}
