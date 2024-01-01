//
//  WeatherModel.swift
//  Weather_2024
//
//  Created by Artem Zhuzhgin on 17.12.2023.
//



import Foundation
import UIKit

struct Weather: Hashable, Decodable {
    
    
    let location: Location
    let current: Current
    let forecast: Forecast
    
}
    struct Location: Decodable, Hashable {
    let name: String
    let region : String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: String
}
    
struct Current: Decodable, Hashable {
    let last_updated_epoch: Int
    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: Condition
    
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c:Double
    let feelslike_f: Double
    let vis_km: Double
    let vis_miles:Double
    let uv: Double
    let gust_mph: Double
    let gust_kph: Double
}
struct Condition: Decodable, Hashable {
    let text: String
    let icon: String
    let code: Int
}


struct Forecast: Decodable,Hashable {
    let forecastday: [Forecastday]

}
    
    struct Forecastday: Decodable, Hashable {
        let date: String
        let date_epoch: Int
        let day: Day
        let astro: Astro
        let hour: [Hour]

        
    }
    
    struct Day: Decodable, Hashable {
        let maxtemp_c: Double
        let mintemp_c: Double
        let avgtemp_c: Double
        let maxwind_kph: Double
        let condition: Condition
        
    }
    
    
    struct Astro: Decodable, Hashable {
        let sunrise: String
        let sunset: String
        let moonrise: String
        let moonset: String
        let moon_phase: String
        let moon_illumination: Int
        let is_moon_up: Int
        let is_sun_up: Int
    }
    
    
    struct Hour: Decodable, Hashable {
        
        let time: String
        let temp_c: Double
        let temp_f: Double
        let is_day: Int
        let condition: Condition
        
        let wind_kph: Double
        let wind_degree: Int
        let wind_dir: String
        let pressure_mb: Double
        let pressure_in: Double
        let precip_mm: Double
        let precip_in: Double
        let humidity: Int
        let cloud: Int
        let feelslike_c:Double
        let feelslike_f: Double
        let vis_km: Double
        let uv: Double
        let gust_kph: Double

        
    }
    
    
    
   
