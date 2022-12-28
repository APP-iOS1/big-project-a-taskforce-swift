//
//  ContentView.swift
//  Payment
//
//  Created by Donghoon Bae on 2022/12/27.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            PaymentCompleteView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCompleteView()
    }
}
