//
//  AnalyticManager.swift
//  AnalyticManager
//
//  Created by Manav on 31/08/21.
//

import UIKit

protocol AnalyticsType {
  associatedtype Event: EventType
  func register(provider: ProviderType)
  func log(_ event: Event)
  func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

protocol ProviderType {
  var providerType: EventProviderType { get }
  func log(_ eventName: String, parameters: [String: Any]?)
  func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
  
}

protocol EventType {
  var name : String { get }
  var parameters: [String: Any]? { get }
  var providerType: [EventProviderType] { get }
}

class Analytics<Event: EventType>: AnalyticsType {
  var providers: [ProviderType] = []
  
  public init() {
    
  }
  
  func register(provider: ProviderType) {
    self.providers.append(provider)
  }
  
  func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    for provider in providers {
      provider.initialize(application: application,launchOptions: launchOptions)
    }
  }
  
  func log(_ event: Event) {
    for provider in self.providers {
      if  event.providerType.contains(provider.providerType) {
        let eventName = event.name
        let parameters = event.parameters
        provider.log(eventName, parameters: parameters)
      }
    }
  }
}
