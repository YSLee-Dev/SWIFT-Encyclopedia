//
//  MainTextField.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import UIKit

import Common

import Then
import SnapKit

class MainTextField: UIView {
    let border = UIView().then {
        $0.backgroundColor = .label
    }
    
    let textField = UITextField().then {
        $0.placeholder = "검색할 항목을 입력하세요."
        $0.backgroundColor = .systemBackground
    }
    
    let cancelBtn = UIButton().then {
        $0.titleLabel?.font = .boldSystemFont(ofSize: FontStyle.mid.ofSize)
        $0.setTitleColor(.label, for: .normal)
        $0.setTitle("취소", for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
        self.searchOff()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTextField {
    private func layout() {
        [self.textField, self.cancelBtn].forEach {
            self.addSubview($0)
        }
        self.cancelBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-8)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.width.equalTo(32)
        }
        self.textField.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(8)
            $0.trailing.equalTo(self.cancelBtn.snp.leading).offset(-4)
        }
        
        self.textField.addSubview(self.border)
        self.border.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(4)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func searchOn() {
        self.cancelBtn.alpha = 1
        
        self.textField.snp.remakeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(8)
            $0.trailing.equalTo(self.cancelBtn.snp.leading).offset(-4)
        }
    }
    
    func searchOff() {
        self.cancelBtn.alpha = 0
        self.textField.snp.remakeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
}
