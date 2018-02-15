//
//  AddAddressUseCase.swift
//  ShopClient
//
//  Created by Radyslav Krechet on 1/29/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import ShopClient_Gateway

struct AddAddressUseCase {
    private let repository: Repository!

    init() {
        self.repository = nil
    }

    func addAddress(with address: Address, callback: @escaping RepoCallback<String>) {
        repository.addCustomerAddress(with: address, callback: callback)
    }
}
