//
//  CustomTabBar.swift
//  toDoList_prog
//
//  Created by Хамза Кабылбек on 04.09.2024.
//

import UIKit

class CustomTabBar: UITabBar {

    private var shapeLayer: CALayer?

    override func draw(_ rect: CGRect) {
        self.addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0

        shapeLayer.shadowOffset = CGSize(width: 0, height: 5)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.3

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let height: CGFloat = 30.0
        let path = UIBezierPath(
            roundedRect: CGRect(x: 0, y: self.bounds.minY - 10, width: self.bounds.width, height: self.bounds.height + 10),
            cornerRadius: height / 2
        )
        return path.cgPath
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame = self.frame
        tabFrame.size.height = 60 + self.safeAreaInsets.bottom
        tabFrame.origin.y = self.frame.origin.y + self.frame.height - 60 - self.safeAreaInsets.bottom
        self.layer.cornerRadius = 20
        self.frame = tabFrame
    }
}
