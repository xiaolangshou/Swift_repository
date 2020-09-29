//
//  ViewController.swift
//  MVVMDemo(pure)
//
//  Created by Thomas Lau on 2020/9/29.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel!
    var showGreetingButton: UIButton!
    var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        let model = Person(firstName: "Tao", lastName: "Liu")
        viewModel = ViewModel(person: model)
        
        viewModel?.greetingDidchange = { [unowned self] vm in
            self.greetingLabel.text = vm.greeting
        }
    }

    func setupView() {
        
        self.greetingLabel = UILabel(frame: CGRect(x: 10,
                                                   y: 50,
                                                   width: 200,
                                                   height: 50))
        self.greetingLabel.backgroundColor = UIColor.cyan
        self.greetingLabel.textAlignment = .center
        self.greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.greetingLabel)
        
        self.showGreetingButton = UIButton(frame: CGRect(x: 10,
                                                         y: 120,
                                                         width: 100,
                                                         height: 50))
        self.showGreetingButton.backgroundColor = UIColor.green
        self.showGreetingButton.setTitle("Click me", for: .normal)
        self.showGreetingButton.setTitle("You badass", for: .highlighted)
        self.showGreetingButton.setTitleColor(UIColor.white, for: .normal)
        self.showGreetingButton.setTitleColor(UIColor.red, for: .highlighted)
        self.showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        self.showGreetingButton.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        self.view.addSubview(self.showGreetingButton)
    }
    
    @objc func didTapButton(sender: UIButton) {
        
        // guard let vm = self.viewModel else { return }
        
        self.viewModel.showGreeting()
    }
}

