//
//  ImgurGoLiveAlert.swift
//  Imgur-Go-Live
//
//  Created by Nick Piscopio on 10/10/24.
//

import Foundation

struct ImgurGoLiveAlert: Identifiable {
    var id =  UUID()
    var title: String
    var description: String
    var positiveAction: AlertAction
    var negativeAction: AlertAction?
}

struct AlertAction {
    var title: String
    var action: () -> Void
}
