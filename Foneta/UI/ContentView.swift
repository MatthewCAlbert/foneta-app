//
//  ContentView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 08/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
