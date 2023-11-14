//
//  MainViewModel.swift
//  ProjectDescriptionHelpers
//
//  Created by 이윤수 on 11/13/23.
//

import Foundation

import RxSwift
import RxCocoa

public class MainViewModel {
    let bag = DisposeBag()
    
    struct Input {
        let tfText: Observable<String>
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        input.tfText
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: self.bag)
        return Output()
    }
    
    public init(
        
    ) {
        
    }
}
