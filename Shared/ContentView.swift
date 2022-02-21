//
//  ContentView.swift
//  Shared
//
//  Created by Ryuichi Aida on 2022/02/20.
//

import SwiftUI

struct ContentView: View {
    @State private var hasPmallLabel = true

    private var barItemButtonText: String {
        return hasPmallLabel ? "remove pmall" : "add pmall"
    }

    fileprivate func famousRankingList() -> some View {
        return VStack(alignment: .leading, spacing: 12) {
            Text("注目の人気ランキング")
                .font(.title)
                .bold()

            ScrollView(.horizontal) {
                HStack {
                    ForEach(1 ... 5, id: \.self) { num in
                        ItemRankingListView(hasPmallLabel: hasPmallLabel)
                            .frame(width: 250, height: 450)
                            .id(num)
                    }
                }
            }
        }
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    famousRankingList()
                }
            }.padding(.init(top: 8, leading: 8, bottom: 0, trailing: 0))
                .navigationBarTitle(Text("Top"))
                .navigationBarItems(trailing:
                    HStack {
                        Button(barItemButtonText) {
                            hasPmallLabel.toggle()
                        }
                    })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
