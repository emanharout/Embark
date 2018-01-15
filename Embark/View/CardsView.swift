//
//  CardsView.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/10/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit
import Koloda

class CardsView: UIView {
	
	@IBOutlet var kolodaView: KolodaView!
	
	func currentCardIndex() -> Int {
		return kolodaView.currentCardIndex
	}
	
	func remainingCards() -> Int {
		return kolodaView.countOfCards
	}
	
}
