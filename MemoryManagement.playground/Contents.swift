import UIKit

class User {
    var name: String
    
    var subscriptions: [CarrierSubscription] = []
    
    private(set) var phones: [Phone] = []
    func add(phone: Phone) {
        phones.append(phone)
        phone.owner = self
    }
    
    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    deinit {
        print("User \(name) is being deallocated")
    }
}

class Phone {
    let model: String
    weak var owner: User?
    
    var carrierSubscription: CarrierSubscription?
    
    func provision(carrierSubscription: CarrierSubscription) {
        self.carrierSubscription = carrierSubscription
    }
    
    func decommission() {
        self.carrierSubscription = nil
    }
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is baing deallocated")
    }
}

class CarrierSubscription {
    let name: String
    let countryCode: String
    let number: String
    unowned let user: User
    
    lazy var completePhoneNumber: () -> String = {
        [unowned self] in
        return self.countryCode + " " + self.number
    }
    
    init(name: String, countryCode: String, number: String, user: User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        
        user.subscriptions.append(self)
        
        print("CarrierSubscription \(name) is initialized")
    }
    
    deinit {
        print("CarrierSubscription \(name) is baing deallocated")
    }
}

do {
    let iPhone = Phone(model: "iPhone 7")
    let user1 = User(name: "John")
    user1.add(phone: iPhone)
    let subscription1 = CarrierSubscription(name: "VivaTel", countryCode: "+359", number: "0888123456", user: user1)
    iPhone.provision(carrierSubscription: subscription1)
    print(subscription1.completePhoneNumber())
}

class WWDCGreeting {
    let who: String
    
    init(who: String) {
        self.who = who
    }
    
    lazy var greetingMaker: () -> String = {
        [weak self] in
        guard let strongSelf = self else {
            return "No greetings available"
        }
        
        return "Hello \(strongSelf.who)"
    }
}

let greetingMaker: () -> String

do {
    let mermaid = WWDCGreeting(who: "caffinated mermaid")
    greetingMaker = mermaid.greetingMaker
}

greetingMaker()
