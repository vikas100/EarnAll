//
//  Service.swift
//  BMWMilleniumAuto
//
//  Created by o.c on 10/13/2558 BE.
//  Copyright © 2558 com.excelbangkok. All rights reserved.
//

import UIKit
import Alamofire
import SystemConfiguration

enum ServiceAPI : Int {
    case Offline,Success,Error,Expired
}

class LoginAPI : NSObject{
    dynamic var id = ""
    dynamic var error = ""
    dynamic var errorDescription = ""
    dynamic var accessToken = ""
    dynamic var tokenType = ""
    dynamic var expiresIn = ""
    dynamic var userName = ""
}

class PostResponse: NSObject {
    var userMessage = ""
    var devMessage  = ""
    var statusCode = ""
    var Message = ""
    var ExceptionMessage = ""
    var ExceptionType = ""
    var ModelState = ""
    var StackTrace = ""
}

class BaseModel: NSObject {
    override init(){
        super.init()
    }
    required init(source : NSDictionary) {
    }
    
}

class Service {
    
    static func getHeader() -> Dictionary<String,String>{
        return ["Authorization":"Bearer " + Service.login.accessToken]
    }
    
    static let login : LoginAPI = LoginAPI()
    
    static let service = Service()
    
    static func getInstance() -> Service {
        return service
    }
    
    init(){
        
    }
    
    init(instanceType : String){
        
    }
    
    static func getApiURL() -> String {
        return "https://allearn.herokuapp.com/api/"
    }
    
    func getOfflineMessage()->String {
        
        return "กรุณาเชื่อมต่ออินเตอร์เน็ต"
        
    }
    
    func getErrorMessage()->String{
        
        return  "ขออภัย ไม่สามารถทำรายการได้ในขณะนี้"
    }
    
    func get<T: BaseModel>(path: String , parameters: [String: AnyObject]? = nil,type: T.Type,response :(result : ServiceAPI , data : [T]?, errorMessage : String )-> ())
    {
        if( isConnectedToNetwork())
        {
            
            Alamofire.Manager.sharedInstance.request(.GET, "\(Service.getApiURL())\(path )", parameters: parameters, encoding: .URL, headers: nil).validate().responseJSON{ (responseData : Response<AnyObject, NSError>) in
                
                //            Alamofire.request(.GET,Service.getApiURL() + path ,headers: Service.getHeader(),parameters : parameters).response { request, responseService , data ,error in
                ////
                //                if( responseData == nil)
                //                {
                //                    response(result: ServiceAPI.Offline,data: nil,errorMessage : self.getOfflineMessage())
                //                    return
                //                }
                
                //                let result = EXObjectMapper.sharedInstance().objectFromSource(data, toInstanceOfClass: PostResponse.self) as! PostResponse
                
                
                if(responseData.response?.statusCode == 200)
                {
                    //                    if(Int(result.statusCode) != 200)
                    //                    {
                    //                        response(result: ServiceAPI.Error, data: nil,errorMessage : result.userMessage)
                    //                    }
                    //                    else{
                    
                    switch responseData.result {
                    case .Success(let data ):
                        
                        
                        
//                        if( data.isKindOfClass(NSDictionary))
//                        {
//                            var items : NSObject?
//                            
//                            
//                            if let item = (data as? NSDictionary) {
//                                items = item as NSObject
//                            }
                        
//                            var resultArray = [T]()
//                            if(data.isKindOfClass(NSArray))
//                            {
//                                let itemsArray = data as! NSArray
//                                for i in 0 ..< itemsArray.count  {
//                                    
//                                    let source = itemsArray[i] as! NSDictionary
//                                    
//                                    if source.isKindOfClass(NSDictionary) {
//                                        resultArray.append(type.init(source: source))
//                                    }
//                                }
//                            }
//                            else{
//                                resultArray.append(type.init(source: data as! NSDictionary))
//                            }
//                            response(result: ServiceAPI.Success, data: resultArray,errorMessage : "")
                        
                            
                            
                            
//                            if( data.isKindOfClass(NSDictionary))
//                            {
                                var items : NSObject? = data as? NSObject
                                
                                if let item = (data as! NSDictionary)["data"]!["docs"] {
                                    items = item as? NSObject
                                }
                                
//                                if let item = (data as! NSDictionary)["item"] {
//                                    items = item as? NSObject
//                                }
//                                
                                var resultArray = [T]()
                                if(items!.isKindOfClass(NSArray))
                                {
                                    let itemsArray = items as! NSArray
                                    for i in 0 ..< itemsArray.count  {
                                        
                                        let source = itemsArray[i] as! NSDictionary
                                        
                                        if source.isKindOfClass(NSDictionary) {
                                            resultArray.append(type.init(source: source))
                                        }
                                    }
                                }
                                else{
                                    resultArray.append(type.init(source: items! as! NSDictionary))
                                }
                                response(result: ServiceAPI.Success, data: resultArray,errorMessage : "")
                            
                            
                            
//                        }
//                        else{
////                            response(result: ServiceAPI.Error, data: nil,errorMessage :self.getErrorMessage())
//                        }
                        
                        //                        }
                        //                        catch{
                        //                            response(result: ServiceAPI.Error, data: nil,errorMessage : self.getErrorMessage())
                        //                        }
                        
                        //                        resultData(result : .Success, data: json)
                        break
                    case .Failure(let _):
                        
                        response(result: ServiceAPI.Error,data: nil,errorMessage :self.getErrorMessage())
                        
                        //                        resultData(result : .Error,data:error)
                        break
                    }
                    
                    //                    }
                }
                else if( responseData.response?.statusCode == 401)
                {
                    response(result: ServiceAPI.Expired,data: nil,errorMessage :self.getErrorMessage())
                }
                else{
                    response(result: ServiceAPI.Error,data: nil,errorMessage :self.getErrorMessage())
                }
            }
        }
        else{
            response(result: ServiceAPI.Offline,data: nil,errorMessage : getOfflineMessage())
        }
    }
    
    func post<T:BaseModel>(path : String, parameters : Dictionary<String,AnyObject>? = nil ,type: T.Type,response :(result : ServiceAPI , data : [T]?, errorMessage : String )-> ()){
        //        if(isConnectedToNetwork())
        //        {
        //            Alamofire.request(.POST,Service.getApiURL()   + path ,headers: Service.getHeader(),encoding:.JSON,parameters : parameters).response { request, responseService , data ,error in
        //                if( responseService == nil)
        //                {
        //                    response(result: ServiceAPI.Offline,data: nil,errorMessage : self.getOfflineMessage())
        //                    return
        //                }
        //                let result = EXObjectMapper.sharedInstance().objectFromSource(data, toInstanceOfClass: PostResponse.self) as! PostResponse
        //
        //                let statusCode = Int(result.statusCode)
        //                if(statusCode != 200)
        //                {
        //                    if statusCode == 420 {
        //                        response(result: ServiceAPI.Error, data: [T](),errorMessage : result.userMessage)
        //                    }
        //                    else{
        //                        response(result: ServiceAPI.Error, data: nil,errorMessage : result.userMessage)
        //                    }
        //
        //                }
        //                else{
        //                    let serialize : NSObject?
        //                    do{
        //                        serialize =  try  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSObject
        //                        if(serialize != nil)
        //                        {
        //                            if( serialize!.isKindOfClass(NSDictionary))
        //                            {
        //                                var items : NSObject?
        //
        //                                if let item = (serialize as! NSDictionary)["items"] {
        //                                    items = item as? NSObject
        //                                }
        //
        //                                if let item = (serialize as! NSDictionary)["item"] {
        //                                    items = item as? NSObject
        //                                }
        //
        //                                var resultArray = [T]()
        //                                if items != nil {
        //                                    if(!items!.isMemberOfClass(NSNull.self))
        //                                    {
        //                                        if(items!.isKindOfClass(NSArray))
        //                                        {
        //                                            let itemsArray = items as! NSArray
        //                                            for i in 0 ..< itemsArray.count  {
        //                                                resultArray.append(type.init(source: itemsArray[i] as! NSDictionary))
        //                                            }
        //                                        }
        //                                        else{
        //
        //                                            resultArray.append(type.init(source: items! as! NSDictionary))
        //
        //                                        }
        //                                    }
        //                                }
        //                                response(result: ServiceAPI.Success, data: resultArray,errorMessage : result.userMessage)
        //                            }
        //                            else{
        //                                response(result: ServiceAPI.Error, data: nil,errorMessage :self.getErrorMessage())
        //                            }
        //                        }
        //                    }
        //                    catch{
        //                        response(result: ServiceAPI.Error, data: nil,errorMessage : self.getErrorMessage())
        //                    }
        //                }
        //
        //            }
        //        }
        //        else{
        //            response(result: ServiceAPI.Offline,data: nil,errorMessage : getOfflineMessage())
        //        }
    }
    
    func postWithBody<T:BaseModel>(path : String, parameters : [AnyObject]? = nil ,type: T.Type,response :(result : ServiceAPI , data : [T]?, errorMessage : String )-> ()){
        //        if(isConnectedToNetwork())
        //        {
        //            let request = NSMutableURLRequest(URL: NSURL(string:Service.getApiURL()   + path  )! )
        //            request.HTTPMethod = "POST"
        //            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(parameters!, options: [])
        //
        //            Alamofire.request(request).response { request, responseService , data ,error in
        //                if( responseService == nil)
        //                {
        //                    response(result: ServiceAPI.Offline,data: nil,errorMessage : self.getOfflineMessage())
        //                    return
        //                }
        //                let result = EXObjectMapper.sharedInstance().objectFromSource(data, toInstanceOfClass: PostResponse.self) as! PostResponse
        //
        //                if(Int(result.statusCode) != 200)
        //                {
        //                    response(result: ServiceAPI.Error, data: nil,errorMessage : result.userMessage)
        //                }
        //                else{
        //                    let serialize : NSObject?
        //                    do{
        //                        serialize =  try  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSObject
        //                        if(serialize != nil)
        //                        {
        //                            if( serialize!.isKindOfClass(NSDictionary))
        //                            {
        //                                var items : NSObject?
        //
        //                                if let item = (serialize as! NSDictionary)["items"] {
        //                                    items = item as? NSObject
        //                                }
        //
        //                                if let item = (serialize as! NSDictionary)["item"] {
        //                                    items = item as? NSObject
        //                                }
        //
        //                                var resultArray = [T]()
        //                                if items != nil {
        //                                    if(items!.isKindOfClass(NSArray))
        //                                    {
        //                                        let itemsArray = items as! NSArray
        //                                        for i in 0 ..< itemsArray.count  {
        //                                            resultArray.append(type.init(source: itemsArray[i] as! NSDictionary))
        //                                        }
        //                                    }
        //                                    else{
        //                                        resultArray.append(type.init(source: items! as! NSDictionary))
        //                                    }
        //                                }
        //                                response(result: ServiceAPI.Success, data: resultArray,errorMessage : result.userMessage)
        //                            }
        //                            else{
        //                                response(result: ServiceAPI.Error, data: nil,errorMessage :self.getErrorMessage())
        //                            }
        //                        }
        //                    }
        //                    catch{
        //                        response(result: ServiceAPI.Error, data: nil,errorMessage : self.getErrorMessage())
        //                    }
        //                }
        //
        //            }
        //        }
        //        else{
        //            response(result: ServiceAPI.Offline,data: nil,errorMessage : getOfflineMessage())
        //        }
    }
    
    
    
    func put<T:BaseModel>(path: String, parameters : Dictionary<String,AnyObject>? = nil ,type: T.Type ,response :(result : ServiceAPI , data : [T]?, errorMessage : String)-> () ){
        //        if(isConnectedToNetwork())
        //        {
        //            Alamofire.request(.PUT,Service.getApiURL()   + path ,headers: Service.getHeader(),encoding:.JSON,parameters : parameters).response { request, responseService , data ,error in
        //
        //                if( responseService == nil)
        //                {
        //                    response(result: ServiceAPI.Offline,data: nil,errorMessage : self.getOfflineMessage())
        //                    return
        //                }
        //                let result = EXObjectMapper.sharedInstance().objectFromSource(data, toInstanceOfClass: PostResponse.self) as! PostResponse
        //
        //                if(Int(result.statusCode) != 200)
        //                {
        //                    response(result: ServiceAPI.Error, data: nil,errorMessage : result.userMessage)
        //                }
        //                else{
        //                    let serialize : NSObject?
        //                    do{
        //                        serialize =  try  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSObject
        //                        if(serialize != nil)
        //                        {
        //                            if( serialize!.isKindOfClass(NSDictionary))
        //                            {
        //                                var items : NSObject?
        //
        //                                if let item = (serialize as! NSDictionary)["items"] {
        //                                    items = item as? NSObject
        //                                }
        //
        //                                if let item = (serialize as! NSDictionary)["item"] {
        //                                    items = item as? NSObject
        //                                }
        //
        //                                var resultArray = [T]()
        //                                if items != nil {
        //                                    if(items!.isKindOfClass(NSArray))
        //                                    {
        //                                        let itemsArray = items as! NSArray
        //                                        for i in 0 ..< itemsArray.count  {
        //                                            resultArray.append(type.init(source: itemsArray[i] as! NSDictionary))
        //                                        }
        //                                    }
        //                                    else{
        //                                        resultArray.append(type.init(source: items! as! NSDictionary))
        //                                    }
        //                                }
        //                                response(result: ServiceAPI.Success, data: resultArray,errorMessage : result.userMessage)
        //                            }
        //                            else{
        //                                response(result: ServiceAPI.Error, data: nil,errorMessage :self.getErrorMessage())
        //                            }
        //                        }
        //                    }
        //                    catch{
        //                        response(result: ServiceAPI.Error, data: nil,errorMessage : self.getErrorMessage())
        //                    }
        //                }
        //
        //            }
        //        }
        //        else{
        //            response(result: ServiceAPI.Offline,data: nil,errorMessage : getOfflineMessage())
        //        }
    }
    
    func upload(URLRequest: URLRequestConvertible, data: NSData , progress : ((Int64, Int64, Int64) -> Void)? = nil , response :(result : ServiceAPI , data : NSData?, errorMessage : String)-> ()){
        //        if(isConnectedToNetwork())
        //        {
        //            Alamofire.upload(URLRequest, data: data)
        //                .progress { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
        //                    progress!(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite)
        //                }.response { (request, responseService, data, error) -> Void in
        //                    if( responseService == nil)
        //                    {
        //                        response(result: ServiceAPI.Offline,data: nil,errorMessage : self.getErrorMessage())
        //                        return
        //                    }
        //                    let result = EXObjectMapper.sharedInstance().objectFromSource(data, toInstanceOfClass: PostResponse.self) as! PostResponse
        //                    if(responseService!.statusCode == 200)
        //                    {
        //                        if(Int(result.statusCode) != 200)
        //                        {
        //                            response(result: ServiceAPI.Error, data: nil,errorMessage : result.userMessage)
        //                        }
        //                        else{
        //                            response(result: ServiceAPI.Success, data: data,errorMessage : "")
        //                        }
        //                    }
        //                    else{
        //                        response(result: ServiceAPI.Error,data: nil,errorMessage :"บันทึกข้อมูลไม่สำเร็จ")//result.userMessage)
        //                    }
        //            }
        //        }
        //        else{
        //            response(result: ServiceAPI.Offline,data: nil,errorMessage : getOfflineMessage())
        //        }
    }
    
    
    func urlRequestWithComponents(urlString:String, parameters:Dictionary<String, AnyObject>? = nil, content:NSData? , headers: [String: String]? = nil) -> (URLRequestConvertible, NSData) {
        
        // create url request to send
        let mutableURLRequest = NSMutableURLRequest(URL: NSURL(string: Service.getApiURL() + urlString)!)
        mutableURLRequest.HTTPMethod = Alamofire.Method.POST.rawValue
        let boundaryConstant = "myRandomBoundary12345";
        
        if(headers == nil)
        {
            let contentType = "multipart/form-data;boundary="+boundaryConstant
            mutableURLRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        }
        
        if let headers = headers {
            for (headerField, headerValue) in headers {
                mutableURLRequest.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        
        
        // create upload data to send
        let uploadData = NSMutableData()
        
        if(content != nil)
        {
            // add image
            uploadData.appendData("\r\n--\(boundaryConstant)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            uploadData.appendData("Content-Disposition: form-data; name=\"file\"; filename=\"file.jpg\"\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            uploadData.appendData("Content-Type: image/jpeg\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            uploadData.appendData(content!)
        }
        // add parameters
        if parameters != nil {
            for (key, value) in parameters! {
                uploadData.appendData("\r\n--\(boundaryConstant)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
                uploadData.appendData("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n\(value)".dataUsingEncoding(NSUTF8StringEncoding)!)
            }
        }
        uploadData.appendData("\r\n--\(boundaryConstant)--\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        
        
        
        // return URLRequestConvertible and NSData
        return (Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: nil).0, uploadData)
    }
    
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    
    
}

