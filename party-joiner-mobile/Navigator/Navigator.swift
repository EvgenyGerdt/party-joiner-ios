//
//  Navigator.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 25.11.2021.
//

import Foundation
import UIKit

protocol Navigator {
    associatedtype Destination
    
    func navigate(to destination: Destination)
}

protocol OnboardingViewControllerDelegate: AnyObject {
    func onboardingViewControllerNextButtonTapped(
        _ viewController: OnboardingViewController
    )
}

class OnboardingViewController: UIViewController {
    weak var delegate: OnboardingViewControllerDelegate?

    private func handleNextButtonTap() {
        delegate?.onboardingViewControllerNextButtonTapped(self)
    }
}
