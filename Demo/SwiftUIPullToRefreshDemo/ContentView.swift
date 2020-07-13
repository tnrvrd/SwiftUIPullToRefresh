//
//  ContentView.swift
//  SwiftUIPullToRefreshDemo
//
//  Created by muhammed on 13.07.2020.
//  Copyright © 2020 MT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 40) {
                
                NavigationLink(destination: ScrollViewDemo().environmentObject(ViewModel())) {
                    Text("ScrollView->ForEach Test")
                }
                
                NavigationLink(destination: ListDemo().environmentObject(ViewModel())) {
                    Text("List Test")
                }
                
            } // VStack
        } // NavigationView
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
