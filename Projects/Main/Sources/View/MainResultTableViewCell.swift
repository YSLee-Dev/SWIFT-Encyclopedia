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
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.textColor = .label
        $0.font = .systemFont(ofSize: FontStyle.mid.ofSize)
    }
    
    let subTitle = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: FontStyle.small.ofSize)
    }
    
    var stackView = UIStackView().then {
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 12
        $0.axis = .horizontal
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
        self.addSubview(self.stackView)
        self.stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        [self.mainTitle, self.subTitle].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    func labelDataSet(title: String, subTitle: String) {
        self.mainTitle.text = title
        self.subTitle.text = subTitle
    }
}
