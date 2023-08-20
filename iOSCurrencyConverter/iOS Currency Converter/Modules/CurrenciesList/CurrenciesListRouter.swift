// 
//  CurrenciesListRouter.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 10-08-2023.
//

import UIKit

protocol CurrenciesListRoutable {
    func dismissList()
}

final class CurrenciesListRouter: CurrenciesListRoutable {
    
    // Section: - Properties
    
    private weak var view: CurrenciesListVC?
    
    // Section: - Init
    
    init(view: CurrenciesListVC) {
        self.view = view
    }
    
    // Section: - CurrenciesListRoutable Protocol Methods
    
    func dismissList() {
        view?.dismiss(animated: true)
    }
}
