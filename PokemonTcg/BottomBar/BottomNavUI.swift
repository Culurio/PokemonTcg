//
//  BottomNavUI.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 24/06/2025.
//

import SwiftUI


struct BottomNavUI: View {
    var body: some View {
        TabView{
            ListUIView(layout: ListLayoutStyle.home)
                .tabItem{
                    Label("",systemImage:"house.fill")
                }
            ListUIView(layout: ListLayoutStyle.favorites)
                .tabItem{
                    Label("",systemImage:"heart.fill")
                }
            
            SettingsUIView()
                .tabItem{
                    Label("",systemImage:"gearshape.fill")
                }
                .background(Color("filterBackground"))
        }
        .background(Color("filterBackground"))
    }
}

#Preview {
    BottomNavUI()
}
