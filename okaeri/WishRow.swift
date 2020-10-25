//
//  WishRow.swift
//  okaeri
//
//  Created by 亜里沙井上 on 2020/10/23.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI

struct WishRow: View {
  let wish: Wish
//    @State private var Butonclick = false　
//    日付をlong1値に直す
  static let deadLineFormatter: DateFormatter = {
    let formatter = DateFormatter()
    
//    formatter.dateStyle = .long
    formatter.dateFormat = "yyyy年MM月dd日"

    return formatter
  }()

  var body: some View {
   
    HStack(alignment: .center) {
        wish.title.map(Text.init)
        .font(.title)
        Spacer()
//      HStack {
        Text("期限")
        wish.deadLine.map { Text(Self.deadLineFormatter.string(from: $0)) }
          .font(.headline)
//        Button(action:{
////            self.Butonclick = true
//        }){
//            Text(" ")
//        }

    }
  }
    
}
