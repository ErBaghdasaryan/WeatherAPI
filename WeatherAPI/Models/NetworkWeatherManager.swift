//  Created by Er Baghdasaryan on 09.10.23.

import UIKit

struct NetworkWeatherManager {
    
    func fetchCurrentWeather(city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=ccee4c995a16a4cbd16a4ef36dcfb205"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
}
