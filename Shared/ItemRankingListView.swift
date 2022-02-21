//
//  ItemView.swift
//  PayPayMallDemo
//
//  Created by Ryuichi Aida on 2022/02/20.
//

import SwiftUI

struct ItemRankingListView: View {
    let hasPmallLabel: Bool

    fileprivate func ImageView(rank: Int) -> some View {
        return ZStack(alignment: .topLeading) {
            Image("item1")
                .resizable()
                .frame(width: 100, height: 100)
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 22, height: 22)
                Circle()
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
                Text("\(rank)")
            }
            .padding(.top, 4)
            .padding(.leading, 4)
        }
    }

    fileprivate func ItemView(rank: Int, hasPmallLabel: Bool) -> some View {
        return HStack(alignment: .top) {
            ImageView(rank: rank)
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 4) {
                    if hasPmallLabel {
                        Image("paypaymall")
                            .resizable()
                            .frame(width: 30, height: 10)
                    }

                    Text("タンスのゲン")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                Text("マットレス三つ")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
                Text("5,480円")
                    .foregroundColor(.red)
                    .bold()
            }
        }
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 1)
                .fill(Color.gray)
            VStack(alignment: .leading) {
                Text("ワンピース")
                    .font(.title2)
                    .onTapGesture {
                        print("tapped category name")
                    }
                Spacer()
                ForEach(1 ... 3, id: \.self) { num in
                    ItemView(rank: num, hasPmallLabel: hasPmallLabel)
                        .onTapGesture {
                            print("tapped item view")
                        }
                    Spacer()
                }
                NavigationLink(destination: SecondView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray)
                            .frame(height: 44)
                        Text("このカテゴリを見る")
                            .foregroundColor(.white)
                    }
                }

            }.padding(16)
        }
    }
}

struct ItemRankingListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRankingListView(hasPmallLabel: true)

        ItemRankingListView(hasPmallLabel: false)
    }
}
