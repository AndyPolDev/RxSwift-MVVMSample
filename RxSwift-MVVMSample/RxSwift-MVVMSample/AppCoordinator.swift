import UIKit

class AppCoordinator {
	private let window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		let viewController = ViewController.instantiate(viewModel: RestaurantListViewModel())
		let navigationController = UINavigationController(rootViewController: viewController)
		if #available(iOS 13, *) {
			navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance
		}
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}
