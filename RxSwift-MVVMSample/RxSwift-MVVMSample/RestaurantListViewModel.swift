import Foundation
import RxSwift

final class RestaurantListViewModel {
	let title: String = "Restaurants"
	private let restaurantService: IRestaurantService
	
	init(restaurantService: IRestaurantService = RestaurantService()) {
		self.restaurantService = restaurantService
	}
	
	func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
		restaurantService.fetchRestaurants().map { $0.map { RestaurantViewModel(restaurant: $0) }}
	}
}
