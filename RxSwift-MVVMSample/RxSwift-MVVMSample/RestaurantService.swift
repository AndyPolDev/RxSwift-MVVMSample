import Foundation
import RxSwift

protocol IRestaurantService {
	func fetchRestaurants() -> Observable<[RestaurantModel]>
}

class RestaurantService: IRestaurantService {
	func fetchRestaurants() -> Observable<[RestaurantModel]> {
		return Observable.create { observer -> Disposable in
			guard let paht = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
				observer.onError(NSError(domain: "", code: -1, userInfo: nil))
				print("!")
				return Disposables.create {}
			}
			
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: paht), options: .mappedIfSafe)
				let restaurants = try JSONDecoder().decode([RestaurantModel].self, from: data)
				observer.onNext(restaurants)
			} catch {
				observer.onError(error)
			}
			return Disposables.create {}
		}
	}
}
