import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	@IBOutlet weak var mainTableView: UITableView!
	
	let disposeBag = DisposeBag()
	private var viewModel: RestaurantListViewModel?
	
	static func instantiate(viewModel: RestaurantListViewModel) -> ViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: .main)
		let viewController = storyboard.instantiateInitialViewController() as! ViewController
		viewController.viewModel = viewModel
		return viewController
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		mainTableView.tableFooterView = UIView()
		navigationItem.title = viewModel?.title
		navigationController?.navigationBar.prefersLargeTitles = true
		mainTableView.contentInsetAdjustmentBehavior = .never
		
		viewModel?.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to: mainTableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
			cell.textLabel?.text = viewModel.displayText
		}.disposed(by: disposeBag)
	}
}
