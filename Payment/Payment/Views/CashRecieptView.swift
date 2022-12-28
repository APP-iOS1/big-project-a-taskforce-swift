//
//  CashRecieptView.swift
//  Payment
//
//  Created by 박성.._1 on 2022/12/28.
//

import SwiftUI

struct CashRecieptView: View {
    @State private var isCheck: Bool = false
    @State private var isCheckSo: Bool = true
    @State private var isCheckJi: Bool = false
    @State private var isCheckSub: Bool = false
    @State private var incomeDeduction: String = "휴대폰번호"
    @State var phoneNumber: String = ""
    var incomDeduction: [String] = ["휴대폰번호", "사업자번호"]
    
    
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
                HStack {
                    HStack {
                        Button {
                            isCheckSo = true
                            isCheckJi = false
                        } label: {
                            Image(systemName: isCheckSo ? "checkmark.circle.fill" : "circle")
                        }
                        Text("소득공제")
                    }
                    HStack {
                        Button {
                            isCheckJi = true
                            isCheckSo = false
                        } label: {
                            Image(systemName: isCheckJi ? "checkmark.circle.fill" : "circle")
                        }
                        Text("지출증빙")
                    }
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Picker("incom deduction", selection: $incomeDeduction) {
                        ForEach(incomDeduction, id: \.self) { item in
                            Text("\(item)")
                        }
                    }
                    TextField("", text: $phoneNumber).textFieldStyle(.roundedBorder)
                }
                
                
                HStack(alignment: .top) {
                    Button {
                        isCheckSub.toggle()
                    } label: {
                        Image(systemName: isCheckSub ? "checkmark.square.fill" : "square")
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
