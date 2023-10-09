//  Created by Er Baghdasaryan on 09.10.23.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    let networkWeatherManager = NetworkWeatherManager()
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(city: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.fetchCurrentWeather(city: "London")
    }
}


