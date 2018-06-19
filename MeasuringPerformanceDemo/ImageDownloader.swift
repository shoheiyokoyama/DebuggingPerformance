import UIKit

final class ImageDownloader {
    private var task: URLSessionDataTask?

    func download(url: URL, completionHandler: @escaping (_ image: UIImage, _ byteString: String) -> Void) {
        task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }

            let formatter = ByteCountFormatter()
            formatter.allowedUnits = [.useKB]
            let byteString = formatter.string(fromByteCount: Int64(data.count))
            completionHandler(image, byteString)
        }
        task?.resume()
    }

    func cancel() {
        task?.cancel()
        task = nil
    }
}
