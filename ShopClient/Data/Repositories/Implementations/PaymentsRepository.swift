//
//  PaymentsRepository.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 11/20/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import Foundation

extension Repository {
    func createCheckout(cartProducts: [CartProduct], callback: @escaping RepoCallback<Checkout>) {
        APICore?.createCheckout(cartProducts: cartProducts, callback: callback)
    }
    
    func getCheckout(with checkoutId: String, callback: @escaping RepoCallback<Checkout>) {
        APICore?.getCheckout(with: checkoutId, callback: callback)
    }
    
    func updateShippingAddress(with checkoutId: String, address: Address, callback: @escaping RepoCallback<Bool>) {
        APICore?.updateShippingAddress(with: checkoutId, address: address, callback: callback)
    }
    
    func updateCustomerDefaultAddress(with addressId: String, callback: @escaping RepoCallback<Customer>) {
        APICore?.updateCustomerDefaultAddress(with: addressId, callback: callback)
    }
    
    func updateCustomerAddress(with address: Address, callback: @escaping RepoCallback<Bool>) {
        APICore?.updateCustomerAddress(with: address, callback: callback)
    }
    
    func addCustomerAddress(with address: Address, callback: @escaping RepoCallback<String>) {
        APICore?.addCustomerAddress(with: address, callback: callback)
    }
    
    func deleteCustomerAddress(with addressId: String, callback: @escaping RepoCallback<Bool>) {
        APICore?.deleteCustomerAddress(with: addressId, callback: callback)
    }
    
    func getShippingRates(with checkoutId: String, callback: @escaping RepoCallback<[ShippingRate]>) {
        APICore?.getShippingRates(with: checkoutId, callback: callback)
    }
    
    func updateCheckout(with rate: ShippingRate, checkoutId: String, callback: @escaping RepoCallback<Checkout>) {
        APICore?.updateCheckout(with: rate, checkoutId: checkoutId, callback: callback)
    }
    
    func pay(with card: CreditCard, checkout: Checkout, billingAddress: Address, customerEmail: String, callback: @escaping RepoCallback<Order>) {
        APICore?.pay(with: card, checkout: checkout, billingAddress: billingAddress, customerEmail: customerEmail, callback: callback)
    }
    
    func setupApplePay(with checkout: Checkout, callback: @escaping RepoCallback<Order>) {
        APICore?.setupApplePay(with: checkout, callback: callback)
    }
}
