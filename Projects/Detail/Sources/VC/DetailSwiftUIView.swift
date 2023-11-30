//
//  DetailSwiftUIView.swift
//  Detail
//
//  Created by 이윤수 on 11/28/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import SwiftUI

import Kingfisher

import Common
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
                    .font(.system(size: FontStyle.titleBig.ofSize, weight: .bold))
                Spacer()
            }
            .padding(.bottom, 8)
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text(self.viewModel.tapEncyclopediaData.description)
                            .padding(.bottom, 20)
                        if self.viewModel.tapEncyclopediaData.thumbnail?.absoluteString != "" && self.viewModel.tapEncyclopediaData.thumbnail != nil {
                            KFImage(self.viewModel.tapEncyclopediaData.thumbnail)
                                .placeholder {
                                    VStack(alignment: .center) {
                                        Image(systemName: "exclamationmark.triangle")
                                            .resizable()
                                            .frame(idealWidth: UIScreen.main.bounds.size.width / 5, idealHeight: UIScreen.main.bounds.size.width / 3)
                                        Text("썸네일 이미지를 지원하지 않습니다.")
                                            .lineLimit(2)
                                            .font(.system(size: FontStyle.mid.ofSize, weight: .bold))
                                    }
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                    HStack(alignment: .top) {
                        Text("참고 URL:")
                        Button(action: {
                            self.delegate?.tapURL(url: self.viewModel.tapEncyclopediaData.url ?? URL(string: "https://naver.com")!)
                        }, label: {
                            Text(self.viewModel.tapEncyclopediaData.url?.absoluteString ?? "URL 정보 없음")
                                .lineLimit(1)
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
