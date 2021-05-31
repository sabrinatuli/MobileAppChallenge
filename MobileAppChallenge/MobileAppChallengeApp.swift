//
//  MobileAppChallengeApp.swift
//  MobileAppChallenge
//
//  Created by Sabrina Hoque Tuli on 29/5/21.
//

import SwiftUI

@main
struct MobileAppChallengeApp: App {
    @StateObject var transmng = TransportManager()
    var body: some Scene {
        WindowGroup {
           DetailView (transMng: transmng)
        }
    }
}
