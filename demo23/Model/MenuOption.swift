//
//  MenuOption.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Issues
    case ListIssues
    case User
    case Settings
    case LogOut
    
    var description: String {
        switch self {
        case .Issues: return "Báo cáo sự cố"
        case .ListIssues: return "Danh sách sự cố"
        case .User: return "Hồ sơ"
        case .Settings: return "Cài đặt"
        case .LogOut: return "Đăng xuất"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Issues: return UIImage(named: "break") ?? UIImage()
        case .ListIssues: return UIImage(named: "fly") ?? UIImage()
        case .User: return UIImage(named: "usericon") ?? UIImage()
        case .Settings: return UIImage(named: "setting") ?? UIImage()
        case .LogOut: return UIImage(named: "logout") ?? UIImage()
        }
    }
}
