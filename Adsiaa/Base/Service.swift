import Foundation
import Alamofire


class Service: NSObject {

class func getTeamData(offset: Int, success: @escaping ([TeamActivity]) -> (), failure: @escaping (String, Int) -> ()) {
    
    let url = "/api/team/"
    
    APIManager.request(
        url,
        method: .get,
        parameters: [:],
        encoding: URLEncoding.default,
        headers: APIManager.requestHeader2(),
        completion: { data in
            
            do {
                let decoded = try JSONDecoder().decode([TeamActivity].self, from: data)
                success(decoded)
            } catch _ {
                failure(APIManager.generateRandomError(), 0)
            }
            
    }) { errorMsg, errorCode  in
        failure(errorMsg, errorCode)
    }
    
}
    class func getProfileData(success: @escaping (profileInfo) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/get_profile/"
        
        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: APIManager.requestHeader(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(profileInfo.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func getCatData(success: @escaping (catData) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/categories/"
        
        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: APIManager.requestHeader2(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(catData.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    
    class func getPlanData(catid:Int,sortId:Int,success: @escaping (plans) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/plans/?id=\(catid)&sort_id=\(sortId)"
        
        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: APIManager.requestHeader2(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(plans.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    
    class func getReviewData(planId:Int,success: @escaping ([getReview]) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/get_review/?plan_id=\(planId)"
        
        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: APIManager.requestHeader2(),
            completion: { data in
                
                do {
                    print("1")
                    let decoded = try JSONDecoder().decode([getReview].self, from: data)
                    print("2")
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    
    class func getCartData(success: @escaping (getCartInfo) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/get-cart/"
        
        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: APIManager.requestHeader(),
            completion: { data in
                
                do {
                    print("1")
                    let decoded = try JSONDecoder().decode(getCartInfo.self, from: data)
                    print("2")
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func removeCartData(cartId: Int, success: @escaping (getCartInfo) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/delete_cart_item/?cartId=\(cartId)"
        
        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: APIManager.requestHeader(),
            completion: { data in
                
                do {
                    print("1")
                    let decoded = try JSONDecoder().decode(getCartInfo.self, from: data)
                    print("2")
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func logInApi(username:String,password:String,success: @escaping (LogInActivity) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/login/"
        
        let params: Parameters = ["username":username, "password":password]
        print(params)
        
        APIManager.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: APIManager.requestHeader2(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(LogInActivity.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func sendEmailApi(email:String,name:String,note:String,success: @escaping (sendEmail) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/send-email/"
        
        let params: Parameters = ["email":email, "name":name, "note":note]
        print(params)
        
        APIManager.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: APIManager.requestHeader2(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(sendEmail.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func logOutApi(success: @escaping (logOutActivity) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/logout/"
        
        let params: Parameters = [:]
        print(params)
        
        APIManager.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: APIManager.requestHeader(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(logOutActivity.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func increaseQtyApi(cartId: Int,success: @escaping (increaseQTY) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/increase_cart_item/?cartId=\(cartId)"
        print(url)
        let params: Parameters = [:]
        print(params)
        
        APIManager.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: APIManager.requestHeader(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(increaseQTY.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    
    class func deincreaseQtyApi(cartId: Int,success: @escaping (increaseQTY) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/decrease_cart_item/?cartId=\(cartId)"
        print(url)
        let params: Parameters = [:]
        print(params)
        
        APIManager.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: APIManager.requestHeader(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(increaseQTY.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func addToCartApi(planid:Int,quantity: Int,success: @escaping (addToCartInfo) -> (), failure: @escaping (String, Int) -> ()) {
        
        let url = "/api/add-to-cart/?planid=\(planid)"
        
        let params: Parameters = ["quantity":quantity]
        print(params)
        
        APIManager.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: APIManager.requestHeader(),
            completion: { data in
                
                do {
                    let decoded = try JSONDecoder().decode(addToCartInfo.self, from: data)
                    success(decoded)
                } catch _ {
                    failure(APIManager.generateRandomError(), 0)
                }
                
        }) { errorMsg, errorCode  in
            failure(errorMsg, errorCode)
        }
        
    }
    class func updateProfile(_ phone: String, _ address: String, photo: UIImage?, success: @escaping (updateProfileData) -> (), failure: @escaping (String, Int) -> ()) {
            
            let url = "/api/update_profile/"
            
            AF.upload(multipartFormData: { (multipartFormData) in
                
                multipartFormData.append(phone.data(using: .utf8)!,
                    withName: "phone")
                multipartFormData.append(address.data(using: .utf8)!,
                    withName: "address")
                
                if photo != nil {
                    let imageData = photo?.jpegData(compressionQuality: 0.4)
                    multipartFormData.append(imageData!, withName: "photo", fileName: "photo.jpg", mimeType: "image/png")
                }
                
            },
    //                         usingThreshold: UInt64.init(),
               to: APIEnvironment.baseURL + url,
               method: .post,
               headers: APIManager.requestHeader()).response { (response) in
                
                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                    guard let callback = response.data else {
                        failure(APIManager.generateRandomError(), 200)
                        return
                    }
                    let responseString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    print(responseString)
                    
                    DispatchQueue.main.async {
                        do {
                            let decoded = try JSONDecoder().decode(updateProfileData.self, from: callback)
                            success(decoded)
                        } catch _ {
                            failure(APIManager.generateRandomError(), 0)
                        }
                    }
                    print(200)
                } else if response.response?.statusCode == 401 {
                    failure(APIManager.generateRandomError(), 401)
                }else if response.response?.statusCode == 202 {
                    guard let callback = response.data else {
                        failure(APIManager.generateRandomError(), 202)
                        return
                    }
                    let responseString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    print(responseString)
                    
                    DispatchQueue.main.async {
                        do {
                            let decoded = try JSONDecoder().decode(updateProfileData.self, from: callback)
                            success(decoded)
                        } catch _ {
                            failure(APIManager.generateRandomError(), 0)
                        }
                    }
                }
                else {
                    print("else")
                    guard let callbackError = response.data else {
                        failure(APIManager.generateRandomError(), 0)
                        return
                    }
                    
                    do {
                        let decoded = try JSONDecoder().decode(APIError.self, from: callbackError)
                        if let messageError = decoded.data?.errors?.messages, let errorCode = decoded.statusCode {
                            let messages = messageError.joined(separator: ", ")
                            failure(messages, errorCode)
                        } else {
                            failure(APIManager.generateRandomError(), 0)
                        }
                    } catch _ {
                        failure(APIManager.generateRandomError(), 0)
                    }
                }
        }
            
        }
}
