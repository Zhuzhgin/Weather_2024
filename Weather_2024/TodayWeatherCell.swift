//
//  TodayWeatherCell.swift
//  Weather_2024
//
//  Created by Artem Zhuzhgin on 19.11.2023.
//

import Foundation
import UIKit


class TodayWeatherCell: UICollectionViewCell {
    static var cellReuseIdentifire = "todayWeatherCell"
    var tempLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        setLabel()
    }
    
    private func setLabel() {
        tempLabel = UILabel(frame: contentView.bounds)
        contentView.addSubview(tempLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

