//
//  MainVCAction.swift
//  Main
//
//  Created by 이윤수 on 11/28/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import Foundation

import Domain

protocol MainVCAction: AnyObject {
    func tapEncyclopediaData(data: EncyclopediaData)
}
