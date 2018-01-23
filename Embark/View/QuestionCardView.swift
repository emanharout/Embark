//
//  QuestionCardView.swift
//  Embark
//
//  Created by Emmanuoel Haroutunian on 1/10/18.
//  Copyright © 2018 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class QuestionCardView: UIView {
	
	private let label = UILabel()
	var model: Model? {
		didSet {
			label.text = model?.questionText
			if let bonusText = model?.bonusText {
				label.text?.append("\n\(bonusText)")
			}
			backgroundColor = model?.backgroundColor
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupLabel()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		layer.cornerRadius = bounds.width / 10.0
	}
	
	private func setupLabel(text: String? = nil) {
		label.text = text
		label.textColor = UIColor.white
		label.font = UIFont.systemFont(ofSize: 20)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		addLabelConstraints()
	}
	
	private func addLabelConstraints() {
		let constraints = [
			label.centerXAnchor.constraint(equalTo: centerXAnchor),
			label.centerYAnchor.constraint(equalTo: centerYAnchor),
			label.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10.0),
			label.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10.0),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0)
		]
		NSLayoutConstraint.activate(constraints)
	}
	
	struct Model {
		let questionText: String
		let bonusText: String?
		let backgroundColor: UIColor
	}
	
}

extension QuestionCardView {
	class func getBackgroundColor(for index: Int) -> UIColor {
		let color: UIColor
		
		switch index % 6 {
		case 0:
			color = UIColor(red: 1.0, green: 25.0 / 255.0 , blue: 149.0 / 255.0, alpha: 1.0)
		case 1:
			color = UIColor(red: 108.0 / 255.0, green: 25.0 / 255.0 , blue: 1.0, alpha: 1.0)
		case 2:
			color = UIColor(red: 253.0 / 255.0, green: 169.0 / 255.0, blue: 123.0 / 255.0, alpha: 1.0)
		case 3:
			color = UIColor(red: 169.0 / 255.0, green: 253.0 / 255.0, blue: 148.0 / 255.0, alpha: 1.0)
		case 4:
			color = UIColor(red: 112.0 / 255.0, green: 79.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0)
		case 5:
			color = UIColor(red: 242.0 / 255.0, green: 229.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
		case 6:
			color = UIColor(red: 242.0 / 255.0, green: 113.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
		default:
			color = UIColor(red: 242.0 / 255.0, green: 113.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
		}
		
		return color
	}
}

extension QuestionCardView.Model {
	init(question: Question, index: Int) {
		self.questionText = question.text
		self.bonusText = question.bonus
		self.backgroundColor = QuestionCardView.getBackgroundColor(for: index)
	}
}
