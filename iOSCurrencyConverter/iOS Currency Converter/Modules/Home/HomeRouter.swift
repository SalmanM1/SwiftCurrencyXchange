// 
//  HomeRouter.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 10-08-2023.
//

import UIKit

protocol HomeRoutable {
    func navigateCurrenciesList(dataStore: CurrencyModuleDataStore)
}

final class HomeRouter: HomeRoutable {
    
    // Section: - Properties
    
    private weak var view: HomeVC?
    
    // Section: - Init
    
    init(view: HomeVC) {
        self.view = view
    }
    
    // Section: - HomeRoutable methods
    
    func navigateCurrenciesList(dataStore: CurrencyModuleDataStore) {
        let currenciesListVC = CurrenciesListBuilder.build(dataStore: dataStore)
        view?.present(currenciesListVC, animated: true)
    }
    
}
