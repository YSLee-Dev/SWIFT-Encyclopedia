//
//  MainViewModel.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import Foundation

import Domain

import RxSwift
import RxCocoa

public class MainViewModel {
    let loadUsecase: MainEncyclopediaUsecaseProtocol
    let nowSearchData = BehaviorRelay<[EncyclopediaSection]>(value: [])
    let bag = DisposeBag()
    
    var nowPage = 1
    var nowLoading = false
    
    struct Input {
        let tfText: Observable<String>
        let doneBtnTap: Observable<Void>
        let scrollCellIndex: Observable<IndexPath>
    }
    
    struct Output {
        let resultData: Driver<[EncyclopediaSection]>
    }
    
    func transform(input: Input) -> Output {
        input.doneBtnTap
            .withLatestFrom(input.tfText)
            .withUnretained(self)
            .flatMap { viewModel, text in
                viewModel.nowPage = 1
                return viewModel.loadUsecase.encyclopediaDataLoad(query: text, nowPage: 1)
            }
            .bind(to: self.nowSearchData)
            .disposed(by: self.bag)
        
        input.scrollCellIndex
            .withUnretained(self)
            .filter { viewModel, index in
                index.row + (index.section * 30) >= (viewModel.nowPage * 30) - 5 && !viewModel.nowLoading && viewModel.nowPage < 100
            }
            .withLatestFrom(input.tfText)
            .withUnretained(self)
            .flatMapLatest { viewModel, text in
                viewModel.nowLoading = true
                viewModel.nowPage += 1
                return viewModel.loadUsecase.encyclopediaDataLoad(query: text, nowPage: viewModel.nowPage)
            }
            .withUnretained(self)
            .map { viewModel, data in
                viewModel.nowLoading = false
                
                var nowData = viewModel.nowSearchData.value
                nowData.append(contentsOf: data)
                return nowData
            }
            .bind(to: self.nowSearchData)
            .disposed(by: self.bag)
        
        return Output(
            resultData: nowSearchData
                .asDriver(onErrorDriveWith: .empty())
        )
    }
    
    public init(
        loadUsecase: MainEncyclopediaUsecaseProtocol
    ) {
        self.loadUsecase = loadUsecase
    }
}
