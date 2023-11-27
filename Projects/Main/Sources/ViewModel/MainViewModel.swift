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
    let nowSearchData = BehaviorSubject<[EncyclopediaSection]>(value: [])
    let bag = DisposeBag()
    
    struct Input {
        let tfText: Observable<String>
        let doneBtnTap: Observable<Void>
    }
    
    struct Output {
        let resultData: Driver<[EncyclopediaSection]>
    }
    
    func transform(input: Input) -> Output {
        input.doneBtnTap
            .withLatestFrom(input.tfText)
            .withUnretained(self)
            .flatMap { viewModel, text in
                viewModel.loadUsecase.encyclopediaDataLoad(query: text)
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
