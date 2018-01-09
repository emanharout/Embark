//
//  PurchasedContentFlowController.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/8/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class PurchasedContentFlowController: UIViewController {
	
	lazy var categoriesViewController: UIViewController = {
		return storyboard?.instantiateViewController(withIdentifier: "CategoriesTableViewController") as? CategoriesTableViewController ?? CategoriesTableViewController()
	}()
	
	lazy var cardsViewController: CardsViewController = {
		return storyboard?.instantiateViewController(withIdentifier: "CardsViewController") as? CardsViewController ?? CardsViewController()
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadNeededChildViewController()
	}
	
	func checkIfCardsPurchased() -> Bool {
		let userDefaults = UserDefaults.standard
		let purchased = userDefaults.bool(forKey: "PurchasedCards")
		return purchased
	}
	
	func loadNeededChildViewController() {
		let purchased = checkIfCardsPurchased()
		let rootViewController: UIViewController
		let hasRootViewController = childViewControllers.count > 0
		
		rootViewController = !purchased ? cardsViewController : categoriesViewController
		
		switch (purchased, hasRootViewController) {
		case (false, false):
			setRootViewController(to: rootViewController)
		case (true, false):
			setRootViewController(to: rootViewController)
		case (true, true):
			guard let currentRootViewController = childViewControllers.first else {
				print("No child view controller found")
				return
			}
			swap(current: currentRootViewController, with: rootViewController)
		default: break
		}
	}
	
	func swap(current viewController: UIViewController, with newViewController: UIViewController) {
		addChildViewController(newViewController)
		viewController.willMove(toParentViewController: nil)
		
		transition(from: viewController, to: newViewController, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { [unowned self] in
			// Contraints
			newViewController.view.translatesAutoresizingMaskIntoConstraints = false
			self.constrainToView(newViewController.view)
		}) { _ in
			newViewController.didMove(toParentViewController: self)
			viewController.removeFromParentViewController()
		}
	}
	
	func setRootViewController(to childViewController: UIViewController) {
		addChildViewController(childViewController)
		childViewController.view.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(childViewController.view)
		constrainToView(childViewController.view)
		childViewController.didMove(toParentViewController: self)
	}
	
	func constrainToView(_ subView: UIView) {
		let constraints = [
			subView.topAnchor.constraint(equalTo: view.topAnchor),
			subView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			subView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
	
}
