import UIKit

enum ImageURL {
    private static let base = "https://lorempixel.com"

    static func make() -> URL {
        let string = base
                + "/\(Int(UIScreen.main.bounds.width))"
                + "/\(Int.random(in: 2..<5))00/"
        return URL(string: string)!
    }
}
