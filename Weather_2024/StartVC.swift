//
//  ViewController.swift
//  Weather_2024
//
//  Created by Artem Zhuzhgin on 12.11.2023.
//

import UIKit

class StartVC: UIViewController {
    
    let weatherStartWebURL = "http://api.weatherapi.com/v1/forecast.json?key=3a655f9805e44ca1b0a161457232411&q="

    var weather: Weather!
//    var weathers = [Weather]()
//
//
//        func fetchWeather(url:String)  {
//
//        NetworkManager.shared.fetchData(url:url) { (result) in
//
//            switch result {
//            case .success(let weather):
//
//                self.weathers[0] = weather
//                print(weather)
//            case  .failure(let error):
//                print(error)
//                        }
//        }
//
//        }



    var weatherInfoCollectionView: UICollectionView!
    var TodayWeatherDataSource: UICollectionViewDiffableDataSource<MainWindowSection, Double>!
    
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
 
        navigationBarConfig()
        setCollectionView()
      
    }
    
    func navigationBarConfig() {
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationItem.title = "Start"
    }
    
    func setCollectionView() {
        weatherInfoCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setCompositionLayout())
        weatherInfoCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(weatherInfoCollectionView)
        weatherInfoCollectionView.backgroundColor = .blue

        
        weatherInfoCollectionView.register(TodayWeatherCell.self, forCellWithReuseIdentifier: TodayWeatherCell.cellReuseIdentifire)
        
        setCollectionDataSource()
        reload()
        
    }
    
    func setCompositionLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: {[unowned self] (sectionIndex, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let section =  MainWindowSection(rawValue: sectionIndex)!
            
            switch section {
            
            
            case .todaysWeatherSection:
                return self.setTodaysWeatherSection()
            case .forecastSection:
                return self.setTodaysWeatherSection()
            case .mapSection:
                return self.setTodaysWeatherSection()
            case .additionInfoSection:
                return self.setTodaysWeatherSection()
            }
            
        })
        
        return layout
        
    }


    private func setTodaysWeatherSection() -> NSCollectionLayoutSection {
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        group.interItemSpacing = .fixed(5)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    private func setCollectionDataSource() {
        
        TodayWeatherDataSource = UICollectionViewDiffableDataSource(collectionView: weatherInfoCollectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayWeatherCell.cellReuseIdentifire, for: indexPath) as! TodayWeatherCell
            cell.tempLabel.text = "\(item)"
            
            return cell
        })
    }
    
    
    private func reload() {
        

        
        NetworkManager.shared.fetchData(url:weatherStartWebURL + "tyumen") { (result) in
            
            
            
            switch result {
            case .success(let weather):
                
                self.weather = weather
                print(weather)

                
                var snapshot = NSDiffableDataSourceSnapshot<MainWindowSection, Double >()
                
                snapshot.appendSections([MainWindowSection.todaysWeatherSection, MainWindowSection.forecastSection, MainWindowSection.mapSection, MainWindowSection.additionInfoSection])

                snapshot.appendItems(
                    [
                        self.weather.forecast.forecastday[0].hour[0].temp_c,
                        self.weather.forecast.forecastday[0].hour[1].temp_c,
                        self.weather.forecast.forecastday[0].hour[2].temp_c,
                        self.weather.forecast.forecastday[0].hour[3].temp_c,
                        self.weather.forecast.forecastday[0].hour[4].temp_c,
                        self.weather.forecast.forecastday[0].hour[5].temp_c,
                        self.weather.forecast.forecastday[0].hour[6].temp_c






                
                
                ], toSection: .todaysWeatherSection)
                self.TodayWeatherDataSource.apply(snapshot, animatingDifferences: false)


            case  .failure(let error):
                print(error)
            }
        }


        
        
    }
    
    
}

