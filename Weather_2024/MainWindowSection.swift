//
//  MainSection.swift
//  Weather_2024
//
//  Created by Artem Zhuzhgin on 14.11.2023.
//

import Foundation
import UIKit

enum MainWindowSection: Int, Hashable, CaseIterable {
    case todaysWeatherSection
    case forecastSection
    case mapSection
    case additionInfoSection
}





struct HourWeather : Hashable {
    let time : String
    let temperature: String
    
}
