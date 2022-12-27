//
//  PaymentView.swift
//  Payment
//
//  Created by Donghoon Bae on 2022/12/27.
//

import SwiftUI

struct PaymentView: View {
    
    @State var bank: String = "은행을 선택해주세요."
    
    var body: some View {
        VStack {
            Picker("bank", selection: $bank) {
                ForEach(banks, id: \.id) { item in
                    Text("\(item.name)")
                }
            }.pickerStyle(.menu)
            Text("은행이름")
            Text("예금주: 쿠팡")
            Text("25,000원")
            Text("입금계좌")
            
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
