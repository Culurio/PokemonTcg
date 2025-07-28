//
//  NetworkMonitor.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 23/07/2025.
//

import Network
import SwiftUI


@MainActor
class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkManagerQueue")

    @Published private(set) var isConnected: Bool = false
    @Published private(set) var connectionType: ConnectionType = .unknown

    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unavailable
        case unknown
    }

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.updateStatus(path: path)
            }
        }

        monitor.start(queue: queue)
    }

    private func updateStatus(path: NWPath) {
        isConnected = path.status == .satisfied

        if path.status == .satisfied {
            if path.usesInterfaceType(.wifi) {
                connectionType = .wifi
            } else if path.usesInterfaceType(.cellular) {
                connectionType = .cellular
            } else if path.usesInterfaceType(.wiredEthernet) {
                connectionType = .ethernet
            } else {
                connectionType = .unknown
            }
        } else {
            connectionType = .unavailable
        }
    }
}
