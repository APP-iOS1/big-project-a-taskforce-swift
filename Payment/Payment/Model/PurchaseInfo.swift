//
//  PurchaseInfo.swift
//  Payment
//
//  Created by 박성민 on 2022/12/28.
//

import Foundation

// MARK: PurchaseInfo
/// 소비자 정보입니다.
struct PurchaseInfo {
    //유저 아이디
    let id: String
    
    //유저 이름
    let userName: String

    //유저 핸드폰번호
    let userPhoneNumber: String

    //입금자 이름
    let depositorName: String

    //받는사람 정보
    let recipient: Recipient

    //장바구니
    let marketBasket: MarketBasket

    //총 결제금액
    let payment: String

    //현금영수증
    let cashReceipt : CashReceipt
    
    //은행이름
    let bankName : String
    
}

// MARK: Recipient
/// 입력한 배송지 정보입니다.
struct Recipient {
    //받는사람 이름
    let name: String

    //받는사람 핸드폰번호
    let phoneNumber: String

    //받는사람 주소
    let adress: String

    //받는사람 요청사항
    let requestedTerm: String
}

// MARK: MarketBasket
/// 소비자의 장바구니 정보입니다.
struct MarketBasket {
    //장바구니 아이디
    let id: String
    
    //장바구니 상품들
    
    let basketProducts: [String]
    
}

// MARK: CashReceipt
/// 현금영수증 정보입니다.

struct CashReceipt {
    
    let id: String
    
    //소득공제정보
    let incomDeduction: String
    
    //현금영수증 번호
    let cashReceiptNumber: String
    
    
}
