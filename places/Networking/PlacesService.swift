//
//  GoogleMapsService.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import Foundation
import GooglePlaces
import Alamofire

class PlacesService: NSObject, Service {

    private var locationManager: CLLocationManager?
    private var currentLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        self.currentLocationInfo()
    }

    private func currentLocationInfo() {
        guard currentLocation == nil else { return }

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
    }

    func getCurrentLocation() -> CLLocationCoordinate2D? {
        return currentLocation
    }

    static func getPhotoUrl(for photo: Photo) -> URL? {
        return URL.init(string: "\(GoogleMapsAPIKeys.googlePhotosHost)?maxwidth=\(photo.width)&key=\(GoogleMapsAPIKeys.googlePlacesApiKey)&photoreference=\(photo.ref)")
    }

   static func loadPhoto(with photo: Photo, completionHandler: @escaping (UIImage?) -> Void) {
    guard let url = getPhotoUrl(for: photo) else { completionHandler(nil)
        return
    }
        AF.request( url,method: .get).response{ response in

         switch response.result {
         case .success(let responseData):
            guard let data = responseData else {
                completionHandler(nil)
                return
            }
              completionHandler(UIImage(data: data, scale:1))

          case .failure(let error):
            print(error.localizedDescription)
            completionHandler(nil)
          }
      }
    }

    func loadPlaces(with pagetoken: String?, completionHandler: @escaping (NearbySearchResponse?) -> Void) {
        guard let token = pagetoken else {
            print("nill")
            completionHandler(nil)
            return }
        let params = configureParameters(with: token)
        AF.request(GoogleMapsAPIKeys.nearbySearchApiHost, parameters: params, encoding: URLEncoding(destination: .queryString)).validate().responseJSON { response in
            switch response.result {
            case .success(_):
                guard let data = response.data else {
                    completionHandler(nil)
                    return
                }
                do {
                    let str = String(decoding: data, as: UTF8.self)
                    print("DATA \(str)")
                    let resp = try JSONDecoder().decode(NearbySearchResponse.self, from: data)
                    completionHandler(resp)
                } catch {
                    print(APIError.resultParsingFailed)
                    completionHandler(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
    }

    private func configureParameters(with token: String) -> Parameters? {
        var parameters: Parameters
        if token != "0" {
            parameters = [GoogleMapsAPIKeys.googlePlacesApiKeyParam: GoogleMapsAPIKeys.googlePlacesApiKey,
                GoogleMapsAPIKeys.pageTokenParam: token
            ]
            return parameters
        }
        if let location = currentLocation {
            parameters = [GoogleMapsAPIKeys.googlePlacesApiKeyParam: GoogleMapsAPIKeys.googlePlacesApiKey,
                GoogleMapsAPIKeys.locationParam: "\(location.latitude),\(location.longitude)",
                GoogleMapsAPIKeys.radiusParam: GoogleMapsAPIKeys.radiusKey]
        } else {
            print("HUI")
            return nil }
        return parameters
    }

}

// MARK: --CLLocationManagerDelegate

extension PlacesService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        manager.stopUpdatingLocation()

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        currentLocation = userLocation.coordinate
        NotificationCenter.default.post(name: .didReceiveLocation, object: nil)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error.localizedDescription)")
    }

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }

}
