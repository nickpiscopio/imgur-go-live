//
//  AlertManager.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import SwiftUI

class AlertManager: ObservableObject {
    @Published var alert: ImgurGoLiveAlert? = nil
    
    func display(_ alert: ImgurGoLiveAlert) {
        self.alert = alert
    }
    
    func dismiss() {
        self.alert = nil
    }
}
