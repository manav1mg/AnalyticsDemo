//
//  Example.swift
//  AnalyticManager
//
//  Created by Manav on 31/08/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let analytics = Analytics<MyAppEvent>()
    let googleAnalytics = GoogleAnalyticsProvider()
    let flurryAnalytics = FlurryAnalyticsProvider()
    let mixPanelAnalytics = MixPanelEventProvider()
    
    analytics.register(provider: googleAnalytics)
    analytics.register(provider: flurryAnalytics)
    analytics.register(provider: mixPanelAnalytics)
    
    if let launchOptions = launchOptions {
      analytics.initialize(application: application, launchOptions: launchOptions)
    }
    
    return true
  }
}



// Need to write on views
func logEvent() {
  let analytics = Analytics<MyAppEvent>()
  analytics.log(.signup(username: "Manav"))
}


// ANother Class
enum MyAppEvent {
  case login(username: String)
  case signup(username: String)
}

extension MyAppEvent: EventType {
  
  var name : String {
    switch self {
    case .signup: return "signup"
    case .login: return "login"
    }
  }
  
  var parameters: [String: Any]? {
    switch self {
    case let .signup(username):
      return ["username": username]
    case let .login(username):
      return ["username": username]
    }
  }
  
  var providerType: [EventProviderType] {
    switch self {
    case .login:
      return [.google]
    default:
      return EventProviderType.allCases
    }
  }
  
}


