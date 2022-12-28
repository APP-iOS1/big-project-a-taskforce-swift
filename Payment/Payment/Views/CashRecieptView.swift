//
//  CashRecieptView.swift
//  Payment
//
//  Created by 박성.._1 on 2022/12/28.
//

import SwiftUI

struct CashRecieptView: View {
    @State private var isCheck: Bool = false
    @State private var isCheckExpenditure: Bool = false
    @State private var incomeDeduction: String = "휴대폰번호"
    @State var phoneNumber: String = ""
    var incomDeductions: [String] = ["소득공제 번호(휴대폰 번호)", "지출증빙 번호(사업자 번호)"]
    
    
    var body: some View {
        
        ScrollView {
            HStack {
                VStack(alignment: .leading ) {
                    HStack {
                        Button {
                            isCheck.toggle()
                        } label: {
                            Image(systemName: isCheck ? "checkmark.square.fill" : "square")
                        }
                        Text("현금영수증 신청")
                    }
                }
                Spacer()
            }
            
            if isCheck {
                VStack(alignment: .leading) {
                    Picker("incom deduction", selection: $incomeDeduction) {
                        ForEach(incomDeductions, id: \.self) { item in
                            Text("\(item)")
                        }
                    }
                    TextField("", text: $phoneNumber).textFieldStyle(.roundedBorder)
                }
                
                
                HStack(alignment: .top) {
                    Button {
                        isCheckExpenditure.toggle()
                    } label: {
                        Image(systemName: isCheckExpenditure ? "checkmark.square.fill" : "square")
                    }
                    Text("현금영수증 발급을 위하여 휴대폰번호 또는 현금 영수증카드번호를 수집하며, 5년간 처리에 동의합니다.")
                }
                
            } else {
                
            }
        }.padding()
    }
}

struct CashRecieptView_Previews: PreviewProvider {
    static var previews: some View {
        CashRecieptView()
    }
}
