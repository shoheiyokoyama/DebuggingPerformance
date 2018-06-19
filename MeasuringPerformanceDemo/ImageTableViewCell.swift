import UIKit
import os.signpost

final class ImageTableViewCell: UITableViewCell {

    static let identifier = String(describing: ImageTableViewCell.self)

    @IBOutlet private weak var contentImageView: UIImageView! {
        didSet {
            contentImageView.clipsToBounds = true
            contentImageView.contentMode = .scaleAspectFill
        }
    }

    private let downloder = ImageDownloader()

    var contentImage: UIImage? {
        return contentImageView.image
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        contentImageView.image = nil
        downloder.cancel()
    }

    func configure(with url: URL, at indexPath: IndexPath) {

        let signpostID = OSSignpostID(log: OSLog.fetchResource)
        os_signpost(type: .begin,
                    log: OSLog.fetchResource,
                    name: "download",
                    signpostID: signpostID,
                    "url: %s, indexPath.row: %d", url.absoluteString, indexPath.row)

        downloder.download(url: url) { [weak self] image, byteString in
            DispatchQueue.main.async {
                self?.contentImageView.image = image

                os_signpost(type: .end,
                            log: OSLog.fetchResource,
                            name: "download",
                            signpostID: signpostID,
                            "byteString: %{size}s", byteString)
            }
        }
    }
}
