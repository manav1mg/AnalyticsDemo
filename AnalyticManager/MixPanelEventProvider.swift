//
//  MixPanelEventProvider.swift
//  AnalyticManager
//
//  Created by Manav on 31/08/21.
//

import UIKit

class MixPanelEventProvider: ProviderType {
  var providerType: EventProviderType {
    .google
  }
  public init() {
  }
  
  func log(_ eventName: String, parameters: [String: Any]?) {
    // log events
  }
  func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    // do initialization
  }
  
}

