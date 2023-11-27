//
//  MainResultTableView.swift
//  Main
//
//  Created by 이윤수 on 11/27/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import UIKit

class MainResultTableView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        self.attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainResultTableView {
    private func attribute() {
        self.register(MainResultTableViewCell.self, forCellReuseIdentifier: MainResultTableViewCell.id)
        self.backgroundColor = .red
    }
}
