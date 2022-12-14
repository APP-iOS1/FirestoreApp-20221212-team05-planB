//
//  _kimWorldApp.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/12.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct _kimWorldApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

@StateObject var rollingStore = RollingStore()
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
//          MakeTeamView()
      }
    }
  }
}
