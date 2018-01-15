//
//  CardsViewController.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/8/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit
import Koloda

class CardsViewController: UIViewController {
	
	var cardsView: CardsView { return view as! CardsView }
	
	let dummyCards = [
		Question(text: "First Question", bonus: nil),
		Question(text: "Second Question", bonus: nil),
		Question(text: "Third Question", bonus: nil),
		Question(text: "Fourth Question", bonus: nil),
		Question(text: "Fifth Question", bonus: nil)
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		cardsView.kolodaView.delegate = self
		cardsView.kolodaView.dataSource = self
	}
	
}

extension CardsViewController: KolodaViewDelegate, KolodaViewDataSource {
	func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
		let view = QuestionCardView(frame: CGRect.zero)
		view.model = QuestionCardView.Model(question: dummyCards[index], index: index)
		return view
	}
	
	func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
		return dummyCards.count
	}
	
	func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
		return DragSpeed.default
	}
}
