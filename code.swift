//
//  PeriodicTableViewController.swift
//  Formatting Quiz
//
//  Created by Dimitri Bouniol on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol PeriodicTableViewControllerDelegate {
    func periodicTableViewController(_ periodicTable: PeriodicTableViewController, didSelectElement element: Element)
}

class PeriodicTableViewController: UIViewController {
    
    var elementsController: ElementsController?
    var selectedElement: Element?
    
    weak var delegate: PeriodicTableViewControllerDelegate?
    
    private var elementViews: [ElementView] = []
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coloringModeControl: ColoringModeControl!
    @IBOutlet weak var layoutModeControl: LayoutModeControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        for element in elementsController.elements {
            var elementView = ElementView(with: element)
            elementView.delegate = self
            
            scrollView.addSubview(elementView)
            elementViews.append(elementView)
        }
    }
    
    @IBAction func changeColoringMode(_ sender: Any) {
        let coloringMode = coloringModeControl.coloringMode
        
        for elementView in elementViews {
            elementView.coloringMode = coloringMode
        }
    }
    
    @IBAction func changeLayoutMode(_ sender: Any) {
        let layoutMode = layoutModeControl.layoutMode
        
        for elementView in elementViews {
            elementView.layoutMode = layoutMode
        }
    }
    
    // This next method was added by a new member of the team. Identify the 10 formatting, naming, and logic issues below:
    @IBAction func chooseRandomElement(_ sender: Any) { // Space needed before opening bracket
        let randomElement = elementsController.elements.randomElement() // Better variable name
        
        var chosenElementView: ElementView!
        
        // e: Better variable name
        for elementView in elementViews {
            if elementView.element == randomElement {  // Parens are legal but do not conform to coding standards
                chosenElementView = elementView
                break // Semi-colons are legal but do not conform to coding standards
            }
        }
        // Removed extra spaces
        chosenElementView.isHighlighted = true  // Extra space before true
        
        delegate?.periodicTableViewController(self, didSelectElement: randomElement) // Poorly formatted delegate call
    } // Closing bracket not aligned
    // No more new additions after this point
}

extension PeriodicTableViewController: ElementViewDelegate {
    func elementViewWasSelected(_ elementView: ElementView) {
        let selectedElement = elementView.element
        
        delegate?.periodicTableViewController(self, didSelectElement: selectedElement)
    }
}
