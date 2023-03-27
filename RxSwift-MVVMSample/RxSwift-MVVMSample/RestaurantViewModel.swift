import Foundation

struct RestaurantViewModel {
	private let restaurant: RestaurantModel
	
	var displayText: String {
		return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
	}
	
	init(restaurant: RestaurantModel) {
		self.restaurant = restaurant
	}
}
