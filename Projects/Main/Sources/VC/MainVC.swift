//
//  MainVC.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import UIKit

import Common
import Domain

import Then
import SnapKit
import RxSwift
import RxCocoa
import RxOptional
import RxDataSources

public class MainVC: UIViewController {
    let viewModel: MainViewModel
    
    let mainTF = MainTextField()
    let mainTableView = MainResultTableView().then {
        $0.isHidden = true
    }
    let mainTitle = UILabel().then {
        $0.font = .boldSystemFont(ofSize: FontStyle.titleBig.ofSize)
        $0.textColor = .label
        $0.text = "백과사전에 오신걸 환영합니다."
    }
    
    let bag = DisposeBag()
    
    public init(
        viewModel: MainViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        self.layout()
        self.bind()
        
    }
}

extension MainVC {
    private func attribute() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func layout() {
        [self.mainTF, self.mainTitle, self.mainTableView].forEach {
            self.view.addSubview($0)
        }
        self.mainTF.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        self.mainTitle.snp.makeConstraints {
            $0.bottom.equalTo(self.mainTF.snp.top).offset(-4)
            $0.leading.trailing.equalTo(self.mainTF).inset(4)
        }
        
        self.mainTableView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.mainTF)
            $0.top.equalTo(self.mainTF.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func bind() {
        self.mainTF.textField.rx.controlEvent(.editingDidBegin)
            .withUnretained(self)
            .subscribe { mainVC, _ in
                mainVC.searchOn()
            }
            .disposed(by: self.bag)
        
        self.mainTF.cancelBtn.rx.tap
            .withUnretained(self)
            .subscribe { mainVC, _ in
                mainVC.searchOff()
            }
            .disposed(by: self.bag)
        
        let input = MainViewModel
            .Input(
                tfText: self.mainTF.textField.rx.text
                    .filterNil(),
                doneBtnTap: self.mainTF.textField.rx.controlEvent(.editingDidEndOnExit)
                    .asObservable(),
                scrollCellIndex: self.mainTableView.rx.willDisplayCell
                    .map {$0.indexPath}
                    .asObservable(),
                encyclopediaTap: self.mainTableView.rx.modelSelected(EncyclopediaData.self)
                    .asObservable()
            )
        
        let dataSources = RxTableViewSectionedAnimatedDataSource<EncyclopediaSection>(
            animationConfiguration: .init(
                insertAnimation: .left, deleteAnimation: .right
            ), configureCell: { _, tableView, index, data in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: MainResultTableViewCell.id) as? MainResultTableViewCell else {
                    return UITableViewCell()
                }
                cell.labelDataSet(title: data.title, subTitle: data.description)
                return cell
            })
        
        let output = self.viewModel.transform(input: input)
        output.resultData
            .drive(self.mainTableView.rx.items(dataSource: dataSources))
            .disposed(by: self.bag)
        
    }
    
    private func searchOn() {
        self.mainTF.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(40)
        }
        UIView.animate(withDuration: 0.1) {
            self.mainTitle.alpha = 0
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut]) {
            self.mainTF.searchOn()
            self.view.layoutIfNeeded()
            self.mainTableView.isHidden = false
        }
    }
    
    private func searchOff() {
        self.mainTF.textField.resignFirstResponder()
        self.mainTF.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut]) {
            self.mainTitle.alpha = 1
            self.view.layoutIfNeeded()
            self.mainTF.searchOff()
            self.mainTableView.isHidden = true
        }
    }
}
