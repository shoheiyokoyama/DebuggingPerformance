import UIKit
import os.signpost

final class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: ImageTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ImageTableViewCell.identifier)

        title = "Photo list"

        os_signpost(type: .event, log: OSLog.pointsOfInterest, name: "LisTableViewControllertVC: viewDidLoad")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
        cell.configure(with: ImageURL.make(), at: indexPath)
        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ImageTableViewCell else { return }
        guard let image = cell.contentImage else { return }

        let vc = PhotoViewController(image: image)
        navigationController?.pushViewController(vc, animated: true)
    }
}
