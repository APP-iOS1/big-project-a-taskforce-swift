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
    
    // State 변수
    /// bank: 선택한 은행의 이름 값을 가짐
    /// accountNum: 선택된 은행의 계좌번호 값을 가짐
    /// textAppear: 은행을 선택했을 때만 아래에 결제 정보들을 보여주게끔 하게 해주는 Bool값
    /// (true -> 보여줌, false -> 보여주지 않음)
    /// selectedBank: 은행 목록에서 선택된 은행을 구별하기 위해 사용한 Bank 객체
    /// isCopied: 계좌번호가 클립보드에 복사됐는지 여부를 담은 Boolean 값
    
    @State var bank: String = ""
    @State var accountNum: String = ""
    @State var textAppear: Bool = false
    @State var selectedBank: Bank = Bank(name: "", account: "", bankImage: "")
    @State var isCopied: Bool = false
    
    // 외부로부터 필요한 변수
    /// 유저 정보 -> 핸드폰번호, 배송지정보, 소비자명, 입금자명
    /// 장바구니 정보 -> 결제금액, 상품정보
    
    
    /// LazyVGrid로 은행목록을 보여주기 위한 column 파라미터 값을 설정
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            
            /// 결제하기 버튼 위까지의 영역은 ScrollView 영역 안에 묶어줌
            ZStack {
                ScrollView {
                    VStack {
                        
                        /// 은행선택 안내문구
                        HStack {
                            Text("은행을 선택해주세요")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .frame(width: 370, height: 30)
                                .border(Color.gray, width: 1)
                        }
                        .padding(.top)
                        
                        
                        /// 은행선택 GridView (2행 3열)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(banks, id:\.id) { item in
                                Button(action: {
                                    accountNum = item.account
                                    textAppear = true
                                    selectedBank = item
                                }){
                                    
                                    /// 은행 버튼 모양을 둥근사각형으로 설정
                                    /// 그 위에 은행 로고와 이름을 표시해 줌
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                        
                                            /// 선택된 버튼은 파란색으로 바뀜
                                            .fill(selectedBank.name == item.name ? Color.blue : Color.clear)
                                        
                                        /// 위에서 부터 로고 이미지, 은행명 순으로 배치
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
                        
                        
                        /// textAppear 값이 true이면 결제정보 값이 보여짐
                        if textAppear {
                            
                            ///위에서부터
                            ///결제금액, 선택된 은행명과 계좌번호, 예금주 순으로 결제정보가 나타남
                            VStack {
                                Text("55,000원")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                HStack {
                                    Text("\(bank) \(accountNum)")
                                    Button(action: {
                                        clipboardData(accountNum)
                                        isCopied = true
                                    }){
                                        Text("복사하기")
                                    }
                                }
                                Text("예금주: 멋사전자")
                                
                                /// 약관 동의 뷰와 현금영수증 설정 뷰가 위에서부터 차례로 불러와짐
                                ToSView()
                                CashRecieptView()
                            }
                        }
                    }
                    
                    /// 뷰 타이틀 설정
                    .navigationTitle("무통장 입금")
                }
                /// ScrollView 끝지점

                /// 클립보드에 복사되면 "복사되었습니다" 문구가 출력됨
                if isCopied {
                    /// 복사되었습니다 문구를 회색 둥근사각형 위에 얹어준다
                    Text("복사되었습니다")
                        .font(.title3)
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 170, height: 40)
                        }
                        /// 문구가 나타나는 위치 조정
                        .offset(y: 280)
                    
                        /// 나타나고 1.0초 후에 버튼은 자동으로 사라진다
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                                withAnimation(.easeIn(duration:1.0)) {
                                    /// 버튼을 사라지게 만들어주는 코드
                                    isCopied = false
                                }
                            }
                        }
                }
            }
            
            
            /// 누르면 결제완료 뷰로 이동하는 NavigationLink 생성
            NavigationLink(destination: {
                PaymentCompleteView()
            }){
                
                /// NavigationLink이 보여지는 문구를 "결제하기"로 설정
                Text("결제하기")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                
                /// NavigationLink를 푸른색 둥근 사각형위에 얹어줌
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(width: 380, height: 60)
                    }
            }
            .padding(20)
        }
    }
    
    
    // MARK : clipboardData(_ message: String)
    /// 클립보드에 계좌번호를 복사하는 함수
    /// message: 복사할 계좌번호
    
    func clipboardData(_ message: String) {
        UIPasteboard.general.setValue(message, forPasteboardType: "public.plain-text")
    }
    
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
