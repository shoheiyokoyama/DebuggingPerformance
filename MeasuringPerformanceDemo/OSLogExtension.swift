import os.signpost
import Foundation

private let bundleID = Bundle.main.bundleIdentifier ?? ""

extension OSLog {
    static let pointsOfInterest = OSLog(subsystem: bundleID, category: .pointsOfInterest)
    static let fetchResource = OSLog(subsystem: bundleID, category: "fetchResource")
}
