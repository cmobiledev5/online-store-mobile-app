//
//  PaymentTypeTableCell.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 12/29/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

protocol PaymentTypeTableCellProtocol: class {
    func didSelectCreditCartPayment()
}

class PaymentTypeTableCell: UITableViewCell {
    @IBOutlet weak var paymentTypeLabel: UILabel!
    @IBOutlet weak var paymentSelectButton: UIButton!
    
    weak var delegate: PaymentTypeTableCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        paymentTypeLabel.text = "Label.Payment.CreditCard".localizable
    }
    
    // MARK: - actions
    @IBAction func selectPaymentTapped(_ sender: UIButton) {
        paymentSelectButton.isSelected = true
        delegate?.didSelectCreditCartPayment()
    }
}
