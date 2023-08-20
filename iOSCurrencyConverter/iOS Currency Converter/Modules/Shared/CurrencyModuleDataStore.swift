//
//  CurrencyModuleDataStore.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 15-08-2023.
//

import Foundation

final class CurrencyModuleDataStore: DataStore {
    
    typealias E = Currency
    
    // Section: - Properties
    
    var selectedElement: Currency?
    var elements: [Currency] = []
    var filteredElements: [Currency] = []
    var dataUpdated: (() -> Void)?
    
    // Section: - Methods
    
    func updateData() {
        dataUpdated?()
    }
}
