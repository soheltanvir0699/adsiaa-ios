//
//  Constant.swift
//  Adsiaa
//
//  Created by appleguru on 28/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import Foundation

class Constant {
    static var AccessToken: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "AccessToken")
        } get {
            var str_user_value = String()
            if UserDefaults.standard.value(forKey: "AccessToken") != nil {
                str_user_value = UserDefaults.standard.value(forKey: "AccessToken") as! String
            }
            return str_user_value
        }
    }
    static var slider_List = ["Home","Plan","Service","Contact Us","Sign Out"]
    static var slider_Image = ["home","plan","service","phone","logout"]
    static var service_List = ["Video & Creative Services", "Online Ad Services", "Websites Services","SEO Services"]
    static var teamImg = ["ceo","coo", "content","grapices","manager","web"]
    static var teamName = ["Sumon Rahman","S.I Farhad", "Tasnim Tajin","Razib Hassan", "Mahfuzur Rahman Chowdury","Shakir"]
    static var teamDes = ["CEO And Motion Designer","COO And Creative Director","Content Writer","Graphic Designer", "Communications Manager", "Web Designer"]
    static var videoImg = ["video1","video2","video3","video4"]
    static var videoName = ["ANIMATED VIDEO ADS","LIVE ACTION VIDEO ADS","INTERVIEW VIDEOS","TESTIMONIAL VIDEOS"]
    static var videoDesc = ["Animated commercials & animated video ads are an affordable way to grow your business online.","People can sometimes relate more to live-action videos, as they communicate emotions quickly. This is because of our ability to read body language.","An interview with the business owner, with satisfied customers or friendly employees is a powerful way to tell the story of a business.","Customer testimonials are videos that show your client talking about the experience of working with your company."]
    
    static var webImg = ["web1","web2","web3","web4","web5","web6","web7","web8"]
    static var webName = ["SMALL BUSINESS WEBSITE SERVICES","CUSTOM WORDPRESS DEVELOPMENT","LANDING PAGE DESIGN & OPTIMIZATION","SALES FUNNEL DESIGN & STRATEGY","ECOMMERCE STORE DESIGN & DEVELOPMENT","WOOCOMMERCE DEVELOPMENT","SHOPIFY STORE DESIGN & DEVELOPMENT","SQUARESPACE DESIGN & DEVELOPMENT"]
    static var webDesc = ["Looking to hire affordable web designers for your business? Set yourself apart from your competitors with a unique search engine optimized website design. Your website is custom designed by experts specifically for your small business.","Highly customizable, with many theme possibilities and thousands of plugins and widgets, WordPress powers millions of websites and blogs, and is trusted by major enterprises like CNN and The New York Times.","When you only have to worry about a single message, the focus of your page will be stronger. The act of using a landing page to target your campaign traffic results in an average increase in conversion rate of 25%.","A sales funnel is a marketing system that leads someone through a systematic process with the goal of purchasing your product or service. The idea behind it is to turn a lead into a prospect, then a prospect into a customer.","We design and develop cost-effective, fully customized end-to-end solutions for manufacturers, distributors, retailers, wholesalers, manufacturer’s reps, and other organizations. We leverage the power of your enterprise e-commerce platforms while creating optimal user experiences.","WooCommerce is a powerful, extendable platform that continues to gain market share due to its flexibility and user-friendly interface. It powers more than 30 percent of all ecommerce websites today including popular brands such as Cosmopolitan, Entrepreneur, Harley Davidson, and New Balance.","Shopify provides an amazingly flexible platform for us to build your store with. Every store is unique, Shopify allows us to tailor the solution to fit your specific business needs, creating a beautiful and seamless user experience.","Squarespace is perfect for small businesses and non-profits that crave a simple, easy-to-navigate site with basic functionality. Stunning templates, beautiful customization, and quality features are all at your fingertips"]
    
    static var onlineImg = ["online1","online2","online3","online4","online5"]
    static var onlineName = ["GOOGLE ADS FOR SERVICES AND LOCAL BUSINESSES","GOOGLE ADS FOR ECOMMERCE","PAID SOCIAL – FACEBOOK & INSTAGRAM ADS","VIDEO ADS","GOOGLE DISPLAY NETWORK ADS"]
    static var onlineDesc = ["Help people connect with your business when they search for your services. This is especially advantageous for local businesses who face significant competition.","Paid advertising is the lifeblood of any online business. And with the lion’s share of traffic, you need to tap into this huge source of revenue.","Social media is not going anywhere and with the ability to target audiences by a dizzying array of demographics, interests, and behaviors this is an invaluable source of conversions.","The use of video advertising on YouTube, Facebook, and Instagram is booming. Both B2B and B2C businesses can take advantage of the most engaging of all media.","The Google Display Network reaches 90% of internet users! If you want to be in front of your audience as they move across the internet this is one of the most cost-effective ways to do it."]
    
    static var country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
    
    static var isLogIn: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: "isLogIn")
        } get {
            var str_user_value:Bool = false
            if UserDefaults.standard.value(forKey: "isLogIn") != nil {
                str_user_value = UserDefaults.standard.value(forKey: "isLogIn") as! Bool
            }
            return str_user_value
        }
    }
   static var UserAllInfo: [String] {
        set {
            UserDefaults.standard.set(newValue, forKey: "UserInfo")
        } get {
            var str_user_value = [String]()
            if UserDefaults.standard.value(forKey: "UserInfo") != nil {
                str_user_value = UserDefaults.standard.value(forKey: "UserInfo") as! [String]
            }
            return str_user_value
        }
    }
}
struct StringValidationConstant {
    static let str_username_missing = "Username required"
    static let str_invalid_email = "Invalid Email"
    static let str_invalid_password = "Invalid Password"
    static let str_password_length = "Password should be 6 characters long"
    static let str_invalid_first_name = "Invalid First Name"
    static let str_invalid_last_name = "Invalid Last Name"
    static let str_invalid_gender = "Invalid Gender"
    static let str_invalid_phone_number = "Invalid Phone Number"
    
    static let str_confirmation_code_missing = "Confirmation code is missing"
    static let str_verification_code_missing = "Verification code is missing"
    static let str_new_password_missing = "New password is missing"
    static let str_invalid_country = "Invalid Country"
}

struct StringConstant {
    static let str_logout_text = "LOGOUT"
    static let str_logout_confirmation = "Are you sure want to logout?"
    static let str_ok_text = "OK"
    static let str_cancel_text = "CANCEL"
    static let strEmail = "Email"
    static let strPassword = "Password"
    static let strPhoneNo = "Phone Number"
    static let strConfirmationCode = "Confirmation Code"
    static let strConfirmRegistation = "Registation Successfull"
}
