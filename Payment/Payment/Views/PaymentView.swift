//
//  PaymentView.swift
//  Payment
//
//  Created by Donghoon Bae on 2022/12/27.
//

import SwiftUI

// MARK: PaymentView
/// 결제를 원하는 은행을 선택하면 결제정보를 띄워준 후
/// 결제하기 버튼으로 결제를 할 수 있게 해 줌

struct PaymentView: View {
    
    @State var bank: String = "은행을 선택해주세요"
    @State var accountNum: String = ""
    @State var btnAppear: Bool = false
    @State var textAppear: Bool = false
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    btnAppear.toggle()
                    textAppear = false
                }){
                    HStack {
                        Text("\(bank)")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .background {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 370, height: 30)
                                    .border(Color.gray, width: 1)
                            }
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                }
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(banks, id:\.id) { item in
                        Button(action: {
                            bank = item.name
                            accountNum = item.account
                            btnAppear.toggle()
                            textAppear = true
                        }){
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray)
                                VStack {
                                    Image("\(item.bankImage)")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("\(item.name)")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                .padding()
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .opacity(btnAppear ? 1 : 0)
                
                if textAppear {
                    VStack {
                        Text("55,000원")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("\(bank) \(accountNum)")
                        Text("예금주: 멋사전자")
                        
                        Spacer().frame(height: 100)
                        
                        Button(action: {
                            
                        }){
                            Text("결제하기")
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.bold)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.purple)
                                        .frame(width: 380, height: 60)
                                }
                        }
                    }
                }
            }
            .navigationTitle("은행선택")
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
