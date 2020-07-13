//
//  ListDemo.swift
//  SwiftUIPullToRefreshDemo
//
//  Created by muhammed on 13.07.2020.
//  Copyright © 2020 MT. All rights reserved.
//

import SwiftUI
import SwiftUIPullToRefresh

struct ListDemo: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: ViewModel
    
    // MARK: - BODY
    var body: some View {
        
        List(viewModel.numbersData, id: \.self) { item in
            
            HStack {
                Spacer()
                Text("\(item)")
                Spacer()
            }
            
        }
        .background(SwiftUIPullToRefresh(action: {
            self.viewModel.readData()
        }, isShowing: $viewModel.dataIsLoading))
    }
}

// MARK: - PREVIEW
struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
        .environmentObject(ViewModel())
    }
}
