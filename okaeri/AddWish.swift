//
//  AppDelegate.swift
//  okaeri
//
//  Created by 亜里沙井上 on 2020/10/23.
//  Copyright © 2020 Balaji. All rights reserved.
//


import SwiftUI

struct AddWish: View {
  static let DefaultWishTitle = "An untitled masterpiece"
  static let DefaultWishGenre = "Genre-buster"

  @State var title = ""
  @State var genre = ""
  @State var deadLine = Date()
  let onComplete: (String, String, Date) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Wish")) {
          TextField("Wish", text: $title)
        }
        Section(header: Text("Genre")) {
          TextField("Genre", text: $genre)
        }
        Section {
          DatePicker(
            selection: $deadLine,
            displayedComponents: .date) {
              Text("いつまで").foregroundColor(Color(.gray))
          }
        }
        Section {
          Button(action: addWishAction) {
            Text("Add Wish")
          }
        }
      }
      .navigationBarTitle(Text("Wish List"), displayMode: .inline)
    }
  }

  private func addWishAction() {
    onComplete(
      title.isEmpty ? AddWish.DefaultWishTitle : title,
      genre.isEmpty ? AddWish.DefaultWishGenre : genre,
      deadLine)
  }
}
