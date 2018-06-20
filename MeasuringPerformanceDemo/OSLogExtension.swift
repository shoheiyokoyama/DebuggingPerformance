import os.signpost
import Foundation

private let bundleID = Bundle.main.bundleIdentifier ?? ""

extension OSLog {

    /// for measuring `OSSignpostType.event`.
    static let pointsOfInterest = OSLog(subsystem: bundleID, category: .pointsOfInterest)

    /// for measuring image download process.
    static let fetchResource = OSLog(subsystem: bundleID, category: "fetchResource")
}
