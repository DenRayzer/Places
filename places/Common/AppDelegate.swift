//
//  AppDelegate.swift
//  places
//
//  Created by Елизавета on 21.11.2020.
//

import UIKit
import GoogleMaps
import GooglePlaces


enum GoogleMapsAPIKeys {

    static let googleMapsApiKey = "AIzaSyCiefdLOYQM88Ko3n41hcEMIeSADO1Khak"
    static let googlePlacesApiKey = "AIzaSyCkC2YquBA4g4QvO0LlH6PJsuQgCfwPQEc"
    static let nearbySearchApiHost = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    static let googlePlacesApiKeyParam = "key"
    static let pageTokenParam = "pagetoken"
    static let radiusParam = "radius"
    static let radiusKey = "5000"
    static let locationParam = "location"
    
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(GoogleMapsAPIKeys.googleMapsApiKey)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

