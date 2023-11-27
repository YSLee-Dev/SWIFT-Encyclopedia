//
//  FontStyle.swift
//  Common
//
//  Created by 이윤수 on 11/27/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

public enum FontStyle: CGFloat {
    case small = 12
    case mid = 16
    case titleBig = 24
    
    public var ofSize: CGFloat {
        self.rawValue
    }
}
