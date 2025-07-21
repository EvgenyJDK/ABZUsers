//
//  NetworkMonitor.swift
//  ABZUsers
//
//  Created by apple on 06.07.2025.
//

import Foundation
import Network

@MainActor
class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published var isConnected = false  // Initialize as false
    @Published var connectionType: NWInterface.InterfaceType? = nil
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return } // fix warning Reference to captured var 'self' in concurrently-executing code; this is an error in Swift 6. Other fix -> use MainActor
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
                self.connectionType = path.availableInterfaces.first(where: { path.usesInterfaceType($0.type) })?.type
            }
        }
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
    
    func checkConnection() {
        DispatchQueue.main.async {
            self.isConnected = self.monitor.currentPath.status == .satisfied
        }
    }
}


extension NWInterface.InterfaceType {
    var description: String {
        switch self {
        case .wifi: return "WiFi"
        case .cellular: return "Cellular"
        case .wiredEthernet: return "Ethernet"
        case .loopback: return "Loopback"
        case .other: return "Other"
        @unknown default: return "Unknown"
        }
    }
}
