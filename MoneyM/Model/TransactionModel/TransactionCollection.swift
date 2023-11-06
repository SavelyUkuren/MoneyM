//
//  TransactionCollection.swift
//  MoneyM
//
//  Created by Air on 06.11.2023.
//

import Foundation

protocol TransactionCollectionProtocol {
    func append(_ transaction: TransactionModel)
    func edit(_ id: Int, newTransaction: TransactionModel)
    func delete(_ id: Int)
    func removeAll()
    func getKeys() -> Dictionary<Int, TransactionModel>.Keys
    func getValues() -> Dictionary<Int, TransactionModel>.Values
    func getTransaction(byID id: Int) -> TransactionModel?
}

class TransactionCollection: TransactionCollectionProtocol {
    
    private var allTransactions: [Int: TransactionModel] = [:]
    
    func append(_ transaction: TransactionModel) {
        let id = allTransactions.count
        allTransactions[id] = transaction
    }
    
    func edit(_ id: Int, newTransaction: TransactionModel) {
        guard allTransactions[id] != nil else { return }
        
        allTransactions[id]?.amount = newTransaction.amount
        allTransactions[id]?.mode = newTransaction.mode
        allTransactions[id]?.categoryID = newTransaction.categoryID
        allTransactions[id]?.date = newTransaction.date
    }
    
    func delete(_ id: Int) {
        allTransactions[id] = nil
    }
    
    func getValues() -> Dictionary<Int, TransactionModel>.Values {
        return allTransactions.values
    }
    
    func getKeys() -> Dictionary<Int, TransactionModel>.Keys {
        return allTransactions.keys
    }
    
    func removeAll() {
        allTransactions.removeAll()
    }
    
    func getTransaction(byID id: Int) -> TransactionModel? {
        return allTransactions[id]
    }
    
}