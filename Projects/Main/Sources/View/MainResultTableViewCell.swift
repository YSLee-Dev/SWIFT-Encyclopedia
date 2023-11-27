//
//  MainResultTableViewCell.swift
//  Main
//
//  Created by 이윤수 on 11/27/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import UIKit

import Common

import SnapKit
import Then

class MainResultTableViewCell: UITableViewCell {
    static let id = "MainResultTableViewCell"
    
    let mainTitle = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: FontStyle.mid.ofSize)
    }
    
    let subTitle = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: FontStyle.small.ofSize)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainResultTableViewCell {
    private func layout() {
        [self.mainTitle, self.subTitle].forEach {
            self.addSubview($0)
        }
        
        self.mainTitle.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(8)
        }
        
        self.subTitle.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.top.bottom.equalTo(self.mainTitle)
            $0.leading.equalTo(self.mainTitle.snp.trailing).offset(8)
        }
    }
    
    func labelDataSet(title: String, subTitle: String) {
        self.mainTitle.text = title
        self.subTitle.text = subTitle
    }
}
