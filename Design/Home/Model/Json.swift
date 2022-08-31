//
//  Json.swift
//  Design
//
//  Created by apple on 16/08/22.
//

import Foundation

// MARK: - Result
struct Result: Codable {
    let transactionDetails: TransactionDetails?
    let psp2C2P: Psp2C2P?
    let onepay: Onepay?
    let status: Bool?
    let errorCode, errorDescription: String?

    enum CodingKeys: String, CodingKey {
        case transactionDetails
        case psp2C2P = "psp2c2p"
        case onepay, status, errorCode, errorDescription
    }
}

// MARK: - Onepay
struct Onepay: Codable {
    let active: Bool?
}

// MARK: - Psp2C2P
struct Psp2C2P: Codable {
    let channelCategories: [ChannelCategory]?
}

// MARK: - ChannelCategory
struct ChannelCategory: Codable {
    let sequenceNo: Int?
    let name, code: String?
    let groups: [ChannelCategory]?
    let details: Details?
    var expanded: Bool?
}

// MARK: - Details
struct Details: Codable {
    let totalChannel: Int?
    let name: String?
    let channels: [Channel]?
    let validation: Validation?
}

// MARK: - Channel
struct Channel: Codable {
    let sequenceNo: Int?
    let name: String?
    let iconURL, logoURL: String?
    let payment: Payment?
    let isDown: Bool?
    let currencyCodes: [CurrencyCode]?

    enum CodingKeys: String, CodingKey {
        case sequenceNo, name
        case iconURL = "iconUrl"
        case logoURL = "logoUrl"
        case payment, isDown, currencyCodes
    }
}

enum CurrencyCode: String, Codable {
    case thb = "THB"
}

// MARK: - Payment
struct Payment: Codable {
    let code: Code?
    let input: Input?
}

// MARK: - Code
struct Code: Codable {
    let channelCode: String?
    let agentCode: String?
    let agentChannelCode: AgentChannelCode?
}

enum AgentChannelCode: String, Codable {
    case atm = "ATM"
    case bankcounter = "BANKCOUNTER"
    case ibanking = "IBANKING"
    case overthecounter = "OVERTHECOUNTER"
    case webpay = "WEBPAY"
}

// MARK: - Input
struct Input: Codable {
    let cardNo, expiryDate, securityCode: AccountNo?
    let name, email: AccountNo?
    let pin, mobileNo, accountNo: AccountNo?
}

enum AccountNo: String, Codable {
    case i = "I"
    case m = "M"
    case o = "O"
}

// MARK: - Validation
struct Validation: Codable {
    let cardNo: CardNo?
}

// MARK: - CardNo
struct CardNo: Codable {
    let prefixes: [String]?
}

// MARK: - TransactionDetails
struct TransactionDetails: Codable {
    let amount: String?
    let currencyCode: CurrencyCode?
    let orderID, transactionDetailsDescription: String?

    enum CodingKeys: String, CodingKey {
        case amount, currencyCode
        case orderID = "orderId"
        case transactionDetailsDescription = "description"
    }
}
