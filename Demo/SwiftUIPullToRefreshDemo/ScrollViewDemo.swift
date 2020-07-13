//
//  ScrollViewDemo.swift
//  SwiftUIPullToRefreshDemo
//
//  Created by muhammed on 13.07.2020.
//  Copyright © 2020 MT. All rights reserved.
//

import SwiftUI
import SwiftUIPullToRefresh

struct ScrollViewDemo: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: ViewModel
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            ForEach(viewModel.numbersData, id: \.self) { item in
                
                VStack {
                    HStack {
                        Spacer()
                        Text("\(item)")
                        Spacer()
                    }
                    Divider()
                } // VStack
                
            } // ForEach
            
        } // ScrollView
        .background(SwiftUIPullToRefresh(action: {
            self.viewModel.readData()
        }, isShowing: $viewModel.dataIsLoading))
    }
}

// MARK: - PREVIEW

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
        .environmentObject(ViewModel())
    }
}
