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
    var timeLabel = UILabel()
    var tempLabel = UILabel()
    var image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow

        setLabel()
        setImage()
        setConstraints()

    }
    
    private func setImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)

    }
    
    private func setLabel() {
        timeLabel.textAlignment = .center
        tempLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(tempLabel)

        
    }
    
    private func setConstraints() {
        let heightSize = (contentView.bounds.size.height - 9) / 3
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: heightSize + 1),
            
            image.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 1),
            image.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: heightSize + 1),
            //image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            tempLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 1),
            tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

