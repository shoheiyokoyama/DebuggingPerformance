import UIKit
import os.signpost

final class PhotoViewController: UIViewController {

    private static let nibName = String(describing: PhotoViewController.self)

    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
           imageView.image = image
        }
    }

    private let image: UIImage

    init(image: UIImage) {
        self.image = image
        super.init(nibName: PhotoViewController.nibName, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photo"
        os_signpost(type: .event, log: OSLog.pointsOfInterest, name: "PhotoViewController: viewDidLoad")
    }
}
