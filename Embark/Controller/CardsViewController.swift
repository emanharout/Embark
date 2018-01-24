//
//  CardsViewController.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/8/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit
import Koloda

protocol CardsViewControllerDelegate: class {
	func setToolBarButtonItem(sender: CardsViewController, item: UIBarButtonItem)
}

// TODO: Add in-app purchase feature: view card history
class CardsViewController: UIViewController {
	
	var cardsView: CardsView { return view as! CardsView }
	weak var delegate: CardsViewControllerDelegate?
	
	let dummyCards = [
		Question(text: "First Question\nFirst Question\nFirst Question\nFirst Question\nFirst Question\nFirst Question\nFirst Question\nFirst Question\nFirst Question\nFirst Question\nFirst Question\n", bonus: nil),
		Question(text: "Second Question \n Second Question", bonus: nil),
		Question(text: "Third Question \n Third Question \n Third Question", bonus: nil),
		Question(text: "If you could go to any place on earth, where would it be and why would you decide to go there, explain in great detail, ok? Thank you! \n \n Bonus: What if you had to also think about this other factor, how would it change your decision and why would it change that way? \n So how is it going, Mark? Tell me all about it please!!!", bonus: nil),
		Question(text: "Fifth Question", bonus: nil)
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		cardsView.kolodaView.delegate = self
		cardsView.kolodaView.dataSource = self
		setupToolbarItem()
	}
	
	@objc func shareSheetTapped() {
		print("I'm alive!")
	}
	
	private func setupToolbarItem() {
		let shareItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareSheetTapped))
		shareItem.tintColor = UIColor.init(red: 0.0/255.0, green: 193.0/255.0, blue: 1.0, alpha: 1.0)
		delegate?.setToolBarButtonItem(sender: self, item: shareItem)
	}
}

extension CardsViewController: KolodaViewDelegate, KolodaViewDataSource {
	func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
		let view = QuestionCardView(frame: CGRect.zero)
		view.model = QuestionCardView.Model(question: dummyCards[index], index: index)
		return view
	}
	
	func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
		return DragSpeed.default
	}
	
	func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
		// TODO: Implement
	}
	
	func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
		// TODO: Implement
	}
	
	func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
		return dummyCards.count
	}
	
	
}
