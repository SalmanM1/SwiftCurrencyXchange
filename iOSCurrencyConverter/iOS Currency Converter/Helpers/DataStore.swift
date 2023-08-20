//
//  DataStore.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 13-08-2023.
//

protocol DataStore: AnyObject {
    
    // SECTION: - Properties
    
    associatedtype E
    var selectedElement: E? { get set }
    var elements: [E] { get set }
    var dataUpdated: (() -> Void)? { get set }

    // SECTION: - Methods
    
    func updateData()
}

