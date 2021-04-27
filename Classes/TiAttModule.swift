//
//  TiAttModule.swift
//  titanium-app-tracking-transparency
//
//  Created by Hans Knoechel
//  Copyright (c) 2021 Your Company. All rights reserved.
//

import UIKit
import TitaniumKit
import AppTrackingTransparency

@objc(TiAttModule)
@available(iOS 14.0, *)
class TiAttModule: TiModule {
  
  func moduleGUID() -> String {
    return "be79853c-5024-4fec-b471-f23ed260a14f"
  }
  
  override func moduleId() -> String! {
    return "ti.att"
  }

  // Constant: Tracking authorized
  @objc let AUTHORIZATION_STATUS_AUTHORIZED = ATTrackingManager.AuthorizationStatus.authorized.rawValue

  // Constant: Tracking denied
  @objc let AUTHORIZATION_STATUS_DENIED = ATTrackingManager.AuthorizationStatus.denied.rawValue

  // Constant: Tracking not determined
  @objc let AUTHORIZATION_STATUS_NOT_DETERMINED = ATTrackingManager.AuthorizationStatus.notDetermined.rawValue

  // Constant: Tracking restricted
  @objc let AUTHORIZATION_STATUS_RESTRICTED = ATTrackingManager.AuthorizationStatus.restricted.rawValue

  // Returns the current tracking status
  @objc let trackingAuthorizationStatus = ATTrackingManager.trackingAuthorizationStatus.rawValue

  /// Checks is tracking permissions are granted
  @objc(hasTrackingPermissions:)
  func hasTrackingPermissions(args: Any?) -> Bool {
    return ATTrackingManager.trackingAuthorizationStatus == .authorized
  }

  /// Requests new tracking permissions
  @objc(requestTrackingPermissions:)
  func requestTrackingPermissions(args: [Any]?) {
    guard let args = args, let callback = args.first as? KrollCallback else {
      return
    }

    ATTrackingManager.requestTrackingAuthorization { (status) in
      callback.call([["status": status.rawValue, "success": status == .authorized]], thisObject: self)
    }
  }
}
