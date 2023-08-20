//
//  ThemeProvider.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 13-08-2023.
//

import Foundation
import UIKit

protocol ThemeProtocol {
    
    // Colors
    var primaryBackgroundColor: UIColor { get }
    var enabledBackgroundColor: UIColor { get }
    var disabledBackgroundColor: UIColor { get }
    var enabledTextColor: UIColor { get }
    var disabledTextColor: UIColor { get }

    // Fonts
    var mainTitleFont: UIFont { get }
    var hintFont: UIFont { get }
    var inputFont: UIFont { get }
    var switcherFont: UIFont { get }
    var bodyFont: UIFont { get }
    var buttonFont: UIFont { get }
    var symbolFont: UIFont { get }
}
