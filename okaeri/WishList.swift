//
//  WishList.swift
//  okaeri
//
//  Created by 亜里沙井上 on 2020/10/23.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI

struct WishList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Wish.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Wish.title, ascending: true)
        ]
        
    ) var wishs: FetchedResults<Wish>
    
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(wishs, id: \.title) {
                        WishRow(wish: $0)
                    }
                    .onDelete(perform: deleteMovie)
                }
                .sheet(isPresented: $isPresented) {
                    AddWish { title, genre, deadLine in
                        self.addMovie(title: title, genre: genre, deadLine: deadLine)
                        self.isPresented = false
                    }
                }
                .navigationBarTitle(Text("okaeri"))
                //      .navigationBarItems(trailing:
                
                //                赤ボタン
                Button(action: { self.isPresented.toggle() }) {
                    Image(systemName: "plus").resizable().frame(width: 25, height: 25).padding()
                }.foregroundColor(.white)
                .background(Color.red)
                .clipShape(Circle())
                .padding(.bottom)
                
                
            }
            
            
            //      )
        }
    }
//    削除関数
    func deleteMovie(at offsets: IndexSet) {
        offsets.forEach { index in
            let wish = self.wishs[index]
            self.managedObjectContext.delete(wish)
        }
        saveContext()
    }
    
//    追加
    func addMovie(title: String, genre: String, deadLine: Date) {
        
        let newWish = Wish(context: managedObjectContext)
        
        
        newWish.title = title
        //    newMovie.genre = genre
        newWish.deadLine = deadLine
        
        
        saveContext()
    }
    
//    セーブ関数
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        WishList()
    }
}
