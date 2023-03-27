import Foundation

struct RestaurantModel: Decodable {
	let name: String
	let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
	case european
	case japanese
	case french
	case indian
	case mexican
	case russian
}
