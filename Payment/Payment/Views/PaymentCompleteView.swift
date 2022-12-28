//
//  PaymentCompleteView.swift
//  Payment
//
//  Created by tae on 2022/12/27.
//

import SwiftUI

struct PaymentCompleteView: View {
    var body: some View {
        VStack {
            ZStack {
                Color(.systemFill)
                    .ignoresSafeArea()
                VStack {
                    
                    VStack(spacing: 10) {
                        Spacer()
                        Text("주문완료")
                            .font(.title)
                        Text("주문 번호: XXXXXXXXXX")
                        Text("아래 가상계좌로 입금해주시면 정상적으로 결제 완료처리가 됩니다.")
                            .opacity(0.7)
                            .multilineTextAlignment(.center)
                        Divider()
                        HStack {
                            Text("가상 계좌 정보")
                            Spacer()
                        }
                        VStack {
                            ZStack {
                                Color(.systemFill)
                                VStack(alignment: .leading) {
                                    VStack(alignment: .leading) {
                                        PaymentInfoView(keyInfo: "입금하실 금액", valueInfo: "250,000")
                                        PaymentInfoView(keyInfo: "예금주 명", valueInfo: "TF")
                                        PaymentInfoView(keyInfo: "입금 기한", valueInfo: "\(Date().plusAdding(hours: 3))")
                                    }
                                }
                                Spacer()
                            }
                            Button("마이 페이지") {
                                print("마이페이지로 가자!")
                            }
                        }
                        .frame(height: 300)
                        Spacer()
                    }
                    .padding(10)
                }
            }
        }
    }
}

struct PaymentInfoView: View {
    var keyInfo: String
    var valueInfo: String
    
    var body: some View {
        ZStack(alignment:.leading) {
            HStack {
                VStack(alignment:.leading) {
                    Text("\(keyInfo)")
                        .font(.title2)
                    Text("- \(valueInfo)")
                }
                Spacer()
            }
            
        }
        .padding(10)
        .frame(height: 50)
    }
}

extension Date {
    func adding(minutes: Int) -> Date {
        Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func adding(hours: Int) -> Date {
        Calendar.current.date(byAdding: .hour, value: hours, to: self)!
    }
    
    func plusAdding(hours: Int) -> Date {
        var formatter_time = DateFormatter()
        formatter_time.dateFormat = "HH"
        var current_time_string = formatter_time.string(from: Date())
        return Calendar.current.date(byAdding: .hour, value: Int(current_time_string)! + hours, to: self)!
    }
}

let startTime = Date.now
let endTime = startTime.adding(hours: 3)

struct PaymentCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCompleteView()
    }
}
