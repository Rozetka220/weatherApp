//
//  TemperatureService.swift
//  weatherApp
//
//  Created by Аделия Исхакова on 15.07.2023.
//

import Foundation

class TemperatureService {
    let defaultKeys = APIKeys()
    
    var coordinats: Coordinats?
    var temperature: TemperatureInfo?
    
    //MARK: - осуществляем запрос к данным на сервер
    func getTemperature(){
        getCoordinats(city: "") { result in
            switch result {
            case .success:
                let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=55.7504461&lon=37.6174943&appid=f538ce98687487163ee0ca2c9eb4f61e&units=metric")!
                let request = URLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data else {return}
                    DispatchQueue.main.async {
                        guard let response = response as? HTTPURLResponse else {return}
                        switch response.statusCode {
                        case 200..<300:
                            do {
                                let decod = try JSONDecoder().decode(TemperatureInfo.self, from: data)
                                print(decod)
                            } catch {
                                print("error parsing")
                            }
                        default:
                            print("bad")
                        }
                    }
                }.resume()
            case .failure:
                print("a")
            }
            
        }
    }
    
    func getCoordinats(city: String, completion: @escaping (Result<[Coordinats], Openweathermap>) -> Void){
        let url = createURL(cityName: "Moscow")
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {assertionFailure("noData"); return}
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse else {return}
                switch response.statusCode {
                case 200..<300:
                    do {
                        let decode = try JSONDecoder().decode([Coordinats].self, from: data)
                        completion(.success(decode))
                    } catch {
                        print("Error decode")
                    }
                default:
                    do {
                        let decode = try JSONDecoder().decode(Openweathermap.self, from: data)
                        completion(.failure(decode))
                    } catch {
                        print("Server return Error")
                    }
                }
            }
        }.resume()
    }
    
    func createURL(cityName: String) -> URL {
        var url = URLComponents(string: defaultKeys.url + "/geo/1.0/direct?")!
        url.queryItems = [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "appid", value: defaultKeys.privateKey)
        ]
        
        return url.url!
    }
}
