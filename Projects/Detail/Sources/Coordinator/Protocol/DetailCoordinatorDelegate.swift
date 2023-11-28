//
//  DetailCoordinatorDelegate.swift
//  Detail
//
//  Created by 이윤수 on 11/28/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import Common

public protocol DetailCoordinatorDelegate: AnyObject {
    func onDisappear(coordinator: CoordinatorProtocol)
}
