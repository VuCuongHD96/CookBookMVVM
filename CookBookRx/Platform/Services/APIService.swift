
import Foundation
import RxSwift
import Alamofire
import ObjectMapper

struct APIService {
    
    static let share = APIService()
    
    private var alamofireManager = Alamofire.Session.default
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        alamofireManager = Alamofire.Session(configuration: configuration)
    }
    
    func request<T: Mappable>(input: BaseRequest) ->  Observable<T> {
        
        print("\n\n------------Rx app")
        print("------------REQUEST INPUT")
        print("link: %@", input.url)
        print("body: %@", input.body ?? "No Body")
        print("------------ END REQUEST INPUT\n")
        
        return Observable.create { observer in
            self.alamofireManager.request(input.url, method: input.requestType,
                                          parameters: input.body, encoding: input.encoding)
                .validate(statusCode: 200..<500)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        guard let statusCode = response.response?.statusCode else {
                            observer.on(.error(BaseError.unexpectedError))
                            return
                        }
                        if statusCode == 200 {
                            if let object = Mapper<T>().map(JSONObject: value) {
                                observer.onNext(object)
                            }
                        } else {
                            if let object = Mapper<ErrorResponse>().map(JSONObject: value) {
                                observer.onError(BaseError.apiFailure(error: object))
                            } else {
                                observer.onError(BaseError.httpError(httpCode: statusCode))
                            }
                        }
                        observer.onCompleted()
                        
                    case .failure:
                        observer.onError(BaseError.networkError)
                    }
            }
            return Disposables.create()
        }
    }
}
