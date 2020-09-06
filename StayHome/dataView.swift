//
//  dataView.swift
//  StayHome
//
//  Created by shaimaa on 06/08/1441 AH.
//  Copyright © 1441 shaimaa12. All rights reserved.
//


import UIKit



class dataView: UIView {
    
    let TCasesView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_cases)
        return view
    }()
    
    let TRecoveredView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_recovered)
        return view
    }()
    
    
    let TUnresolvedView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_unresolved)
        return view
    }()
    
    
    let TDeathsView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_deaths)
        return view
    }()
    
    
    let TNCasesTodayView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_new_cases_today)
        return view
    }()
    

    
    let TNDeathsTodayView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_new_deaths_today)
        return view
    }()
    
    
    let TActiveCasesView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_active_cases)
        return view
    }()
    
    let TSeriousCasesView: cellView = {
        let view = cellView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setView(.total_serious_cases)
        return view
    }()

    
    private var viewStackView_1: UIStackView = {
         let stackView = UIStackView()
         stackView.backgroundColor = .clear
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.distribution = .fillEqually
         stackView.isLayoutMarginsRelativeArrangement = true
         return stackView
     }()
    
    private var viewStackView_2: UIStackView = {
         let stackView = UIStackView()
         stackView.backgroundColor = .clear
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.distribution = .fillEqually
         stackView.isLayoutMarginsRelativeArrangement = true
         return stackView
     }()
    
    private var viewStackView_3: UIStackView = {
         let stackView = UIStackView()
         stackView.backgroundColor = .clear
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.distribution = .fillEqually
         stackView.isLayoutMarginsRelativeArrangement = true
         return stackView
     }()
    
    private var viewStackView_4: UIStackView = {
         let stackView = UIStackView()
         stackView.backgroundColor = .clear
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.distribution = .fillEqually
         stackView.isLayoutMarginsRelativeArrangement = true
         return stackView
     }()
    
    private var viewStackView: UIStackView = {
         let stackView = UIStackView()
         stackView.backgroundColor = .clear
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .vertical
         stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
         stackView.isLayoutMarginsRelativeArrangement = true
         return stackView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(viewStackView_1)
        self.viewStackView_1.addArrangedSubview(TCasesView)
        self.viewStackView_1.addArrangedSubview(TRecoveredView)
        
        self.addSubview(viewStackView_2)
        self.viewStackView_2.addArrangedSubview(TUnresolvedView)
        self.viewStackView_2.addArrangedSubview(TDeathsView)

        self.addSubview(viewStackView_3)
        self.viewStackView_3.addArrangedSubview(TNCasesTodayView)
        self.viewStackView_3.addArrangedSubview(TNDeathsTodayView)

        self.addSubview(viewStackView_4)
        self.viewStackView_4.addArrangedSubview(TActiveCasesView)
        self.viewStackView_4.addArrangedSubview(TSeriousCasesView)
        
        self.addSubview(viewStackView)
        self.viewStackView.addArrangedSubview(viewStackView_1)
        self.viewStackView.addArrangedSubview(viewStackView_2)
        self.viewStackView.addArrangedSubview(viewStackView_3)
        self.viewStackView.addArrangedSubview(viewStackView_4)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
    
        
        NSLayoutConstraint.activate([
        self.viewStackView_1.widthAnchor.constraint(equalToConstant: screenWidth),
        self.viewStackView_2.widthAnchor.constraint(equalToConstant: screenWidth),
        self.viewStackView_3.widthAnchor.constraint(equalToConstant: screenWidth),
        self.viewStackView_4.widthAnchor.constraint(equalToConstant: screenWidth),
    
            
        self.viewStackView.topAnchor.constraint(equalTo: self.topAnchor),
        self.viewStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        self.viewStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
        self.TCasesView.heightAnchor.constraint(equalToConstant: 100),
        self.TRecoveredView.heightAnchor.constraint(equalToConstant: 100),
        self.TNCasesTodayView.heightAnchor.constraint(equalToConstant: 100),
        self.TDeathsView.heightAnchor.constraint(equalToConstant: 100),
        self.TNCasesTodayView.heightAnchor.constraint(equalToConstant: 100),
        self.TNDeathsTodayView.heightAnchor.constraint(equalToConstant: 100),
        self.TActiveCasesView.heightAnchor.constraint(equalToConstant: 100),
        self.TSeriousCasesView.heightAnchor.constraint(equalToConstant: 100),
        
        
        ])
        
        
    }
    
    
    func updateData(_ data: totalData) {
        self.TCasesView.totalLabel.text = "\(data.total_cases)"
        self.TRecoveredView.totalLabel.text = "\(data.total_recovered)"
        
        self.TUnresolvedView.totalLabel.text = "\(data.total_unresolved)"
        self.TDeathsView.totalLabel.text = "\(data.total_deaths)"
        
        self.TNCasesTodayView.totalLabel.text = "\(data.total_new_cases_today)"
        self.TNDeathsTodayView.totalLabel.text = "\(data.total_new_deaths_today)"
        
        self.TActiveCasesView.totalLabel.text = "\(data.total_active_cases)"
        self.TSeriousCasesView.totalLabel.text = "\(data.total_serious_cases)"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

enum DataType {
    case total_cases
    case total_recovered
    case total_unresolved
    case total_deaths
    case total_new_cases_today
    case total_new_deaths_today
    case total_active_cases
    case total_serious_cases
    
}

class cellView: UIView {

    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .pinkColor
        view.layer.cornerRadius = 10
        return view
           
    }()
       
    let icons: UIImageView = {
        let icons = UIImageView()
        icons.contentMode = .scaleAspectFit
        icons.translatesAutoresizingMaskIntoConstraints = false
        return icons
        
    }()
    
    var titelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    
    var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.textAlignment = .left
        label.textColor = .mainColor
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(view)
        self.view.addSubview(icons)
        self.view.addSubview(titelLabel)
        self.view.addSubview(totalLabel)
        
        NSLayoutConstraint.activate([
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
            self.view.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5),
            
            self.icons.widthAnchor.constraint(equalToConstant: 25),
            self.icons.heightAnchor.constraint(equalToConstant: 25),
            self.icons.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 10),
            self.icons.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 10),
            
            self.titelLabel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 12.5),
            self.titelLabel.leftAnchor.constraint(equalTo: self.icons.rightAnchor,constant: 5),
            
            self.totalLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 10),
            self.totalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
    
        
        ])
    }
    
    
    

    func setView(_ type: DataType) {
        switch type {
        case .total_cases:
            self.icons.image = UIImage(named: "1")
            self.titelLabel.text = "Total Cases"
        case .total_recovered:
            self.icons.image = UIImage(named: "2")
            self.titelLabel.text = "Total Recovered"
        case .total_unresolved:
            self.icons.image = UIImage(named: "3")
            self.titelLabel.text = "Total Unresolved"
        case .total_deaths:
            self.icons.image = UIImage(named: "4")
            self.titelLabel.text = "Total Deaths"
        case .total_new_cases_today:
            self.icons.image = UIImage(named: "4")
            self.titelLabel.text = "New Cases Today"
        case .total_new_deaths_today:
            self.icons.image = UIImage(named: "5")
            self.titelLabel.text = "Active Cases"
        case .total_active_cases:
            self.icons.image = UIImage(named: "6")
            self.titelLabel.text = "Active Cases"
        case .total_serious_cases:
            self.icons.image = UIImage(named: "7")
            self.titelLabel.text = "Serious Cases"
         
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
