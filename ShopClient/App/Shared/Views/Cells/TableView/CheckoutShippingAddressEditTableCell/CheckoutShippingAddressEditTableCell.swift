//
//  CheckoutShippingAddressEditTableCell.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 12/21/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

protocol CheckoutShippingAddressEditCellProtocol: class {
    func didTapEdit()
}

class CheckoutShippingAddressEditTableCell: UITableViewCell {
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    weak var delegate: CheckoutShippingAddressEditCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        setupViews()
    }
    
    func configure(with address: Address) {
        populateViews(with: address)
    }
    
    // MARK: - Private
    
    private func setupViews() {
        editButton?.setTitle("Button.Edit".localizable.uppercased(), for: .normal)
    }
    
    private func populateViews(with address: Address) {
        nameLabel?.text = address.fullname
        addressLabel?.text = address.fullAddress
        if let phoneText = address.phone {
            let customerNameLocalized = "Label.Phone".localizable
            phoneLabel?.text = String.localizedStringWithFormat(customerNameLocalized, phoneText)
        } else {
            phoneLabel?.text = nil
        }
    }
    
    // MARK: - Actions
    
    @IBAction func editTapped(_ sender: UIButton) {
        delegate?.didTapEdit()
    }
}
