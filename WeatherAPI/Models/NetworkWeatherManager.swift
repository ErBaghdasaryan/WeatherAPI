//  Created by Er Baghdasaryan on 09.10.23.

import Foundation

protocol NetworkWeatherManagerDelegate: AnyObject {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather)
}

class NetworkWeatherManager {
    
    weak var delegate: NetworkWeatherManagerDelegate?
    
    func fetchCurrentWeather(city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=ccee4c995a16a4cbd16a4ef36dcfb205&units=metric"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(data: data) {
                    self.delegate?.updateInterface(self, with: currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
           let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
