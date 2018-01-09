//
//  PurchaseContentFlowView.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/9/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class PurchaseContentFlowView: UIView {
	
	func constrainToView(_ subView: UIView) {
		let constraints = [
			subView.topAnchor.constraint(equalTo: topAnchor),
			subView.bottomAnchor.constraint(equalTo: bottomAnchor),
			subView.leadingAnchor.constraint(equalTo: leadingAnchor),
			subView.trailingAnchor.constraint(equalTo: trailingAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}

}
