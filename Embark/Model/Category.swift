//
//  Category.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/24/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import Foundation

enum Category: String {
	case friends
	case family
	case couples
	case acquaintances
	case all
	
	func allCategories() -> [String] {
		return [
			Category.friends.rawValue.capitalized,
			Category.family.rawValue.capitalized,
			Category.couples.rawValue.capitalized,
			Category.acquaintances.rawValue.capitalized,
			Category.all.rawValue.capitalized
		]
	}
}
