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
            ListUIView()
                .tabItem{
                    Label("",systemImage:"house.fill")
                }
                .tabItem{
                    SettingsUIView()
                        .tabItem{
                            Label("",systemImage:"gearshape.fill")
                        }
                }
        }
    }
}

#Preview {
    BottomNavUI()
}
