//
//  Device.swift
//  ping pong score
//
//  Created by Ricardo Arana Reyes Guerrero on 17/10/24.
//

import SwiftUI
import Combine

class DeviceOrientation: ObservableObject {
    @Published var isPortrait: Bool = UIDevice.current.orientation.isPortrait

    private var orientationChangePublisher: AnyCancellable?

    init() {
        orientationChangePublisher = NotificationCenter.default
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { [weak self] _ in
                self?.isPortrait = UIDevice.current.orientation.isPortrait
            }
    }

    deinit {
        orientationChangePublisher?.cancel()
    }
}
