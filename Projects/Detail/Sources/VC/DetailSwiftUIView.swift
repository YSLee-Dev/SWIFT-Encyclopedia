//
//  DetailSwiftUIView.swift
//  Detail
//
//  Created by 이윤수 on 11/28/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import SwiftUI

import Domain

public struct DetailSwiftUIView: View {
    public init(
        viewModel: DetailViewModel
    ) {
        self.viewModel = viewModel
    }
    
    @ObservedObject var viewModel: DetailViewModel
    @State var animiation: Bool = false
    weak var delegate: DetailAction?
    
    public var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text(self.viewModel.tapEncyclopediaData.title)
                    .font(.system(size: 26, weight: .bold))
                Spacer()
            }
            .padding(.bottom, 8)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text(self.viewModel.tapEncyclopediaData.description)
                        .padding(.bottom, 20)
                    HStack {
                        Text("참고 URL:")
                        Button(action: {
                            print("버튼눌림")
                        }, label: {
                            Text(self.viewModel.tapEncyclopediaData.url?.absoluteString ?? "URL 정보 없음")
                        })
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
            .frame(width: self.animiation ? UIScreen.main.bounds.size.width - 40 : 0)
            .animation(.easeInOut(duration: 0.35), value: self.animiation)
        }
        .padding()
        .navigationBarTitleDisplayMode(.automatic)
        .onAppear {
            self.animiation = true
        }
        .onDisappear {
            self.delegate?.onDisappear()
        }
    }
}
