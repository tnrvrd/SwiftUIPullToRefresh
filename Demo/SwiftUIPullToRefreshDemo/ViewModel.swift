//
//  ViewModel.swift
//  SwiftUIPullToRefreshDemo
//
//  Created by muhammed on 13.07.2020.
//  Copyright © 2020 MT. All rights reserved.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var dataIsLoading: Bool = false
    
    @Published var numbersData: [Int] = [1, 2, 3]
    
    func readData() {
        self.dataIsLoading = true
        
        // Sleep for 2 second
        let second = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + second) {
            // Generate random random number array
            let number = Int.random(in: 1 ..< 100)
            self.numbersData = (0..<number).map{ _ in Int.random(in: 1 ... 100) }
            self.numbersData.sort()
            
            self.dataIsLoading = false
        }
    }
}
