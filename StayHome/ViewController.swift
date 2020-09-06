//
//  ViewController.swift
//  StayHome
//
//  Created by shaimaa on 29/07/1441 AH.
//  Copyright © 1441 shaimaa12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Constants
    struct Constants {
        static fileprivate let headerHeight: CGFloat = 210
    }

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let headerContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background-1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let mainContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    var titelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        label.textColor = .white
        label.alpha = 0
        label.text = "Covid-19 in Saudi Arabia"
        return label
    }()

    
   // --------------------..
    private var headerTopConstraint: NSLayoutConstraint!
    private var headerHeightConstraint: NSLayoutConstraint!
    private var backgroundImageTopConstraint: NSLayoutConstraint!
    
    var dataArray = [totalData]()
    
    let dataContainerView: dataView = {
        let view = dataView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = .mainColor
        self.view.addSubview(scrollView)
        self.headerContainerView.addSubview(headerImageView)
        self.headerContainerView.addSubview(titelLabel)
        self.scrollView.addSubview(headerContainerView)
        self.scrollView.addSubview(mainContainerView)
        self.mainContainerView.addSubview(dataContainerView)
        self.scrollView.addSubview(backgroundImage)
     
        
        self.mainContainerView.layer.cornerRadius = 20
        self.mainContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.arrangeConstraints()
        coronaReq {
            DispatchQueue.main.async {
                self.dataContainerView.updateData(self.dataArray[0])
                // call func
                self.animatedView()
            }
        }
    }

    
    func coronaReq(completion : @escaping ()->() ) {
          if let url = URL(string: "https://thevirustracker.com/free-api?countryTotal=SA") {
              URLSession.shared.dataTask(with: url) { data, response, error in
                  if let data = data {
                      do {
                          let res = try JSONDecoder().decode(All.self, from: data)
                          self.dataArray = res.countrydata
                          completion()
                      } catch let error {
                            print(error)
                      }
                  }
              }.resume()
            } // end
      }
    
    func arrangeConstraints() {
        
        backgroundImageTopConstraint = backgroundImage.topAnchor.constraint(equalTo: view.topAnchor)
        headerTopConstraint = headerContainerView.topAnchor.constraint(equalTo: view.topAnchor)
        headerHeightConstraint = headerContainerView.heightAnchor.constraint(equalToConstant: 210)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backgroundImageTopConstraint,
            backgroundImage.widthAnchor.constraint(equalToConstant: view.frame.width),
            backgroundImage.heightAnchor.constraint(equalToConstant: view.frame.height),
           
            
            headerTopConstraint,
            headerContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0),
            headerHeightConstraint,
            
            headerImageView.heightAnchor.constraint(equalToConstant: view.frame.height),
            headerImageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            headerImageView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
            
            titelLabel.leftAnchor.constraint(equalTo: headerContainerView.leftAnchor,constant: 10),
            titelLabel.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor,constant: -10),
            
            mainContainerView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            mainContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
 
            dataContainerView.topAnchor.constraint(equalTo: mainContainerView.topAnchor,constant: 10),
            dataContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dataContainerView.heightAnchor.constraint(equalToConstant: 450),
            
      
            
        ])
        
                }
    
    func animatedView() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            let headerHeight = self.view.frame.height - 210
            self.backgroundImageTopConstraint.constant = -headerHeight
            UIView.animate(withDuration: 1, animations: {
                self.view.layoutIfNeeded()
                self.scrollView.delegate = self
            }, completion: { finished in
                self.mainContainerView.topAnchor.constraint(equalTo: self.headerContainerView.bottomAnchor).isActive = true
                self.headerContainerView.alpha = 0
                UIView.animate(withDuration: 0.5) {
                    self.backgroundImage.isHidden = true
                    self.titelLabel.alpha = 1
                    self.headerContainerView.alpha = 1
                }
                
            })
            
        }
    }
    
    

}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0.0 {
            headerHeightConstraint?.constant = Constants.headerHeight - scrollView.contentOffset.y
        } else {
            let parallaxFactor: CGFloat = 0.25
            let offsetY = scrollView.contentOffset.y * parallaxFactor
            let minOffsetY: CGFloat = 8.0
            let availableOffset = min(offsetY, minOffsetY)
            let contentRectOffsetY = availableOffset / Constants.headerHeight
            headerTopConstraint?.constant = view.frame.origin.y
            headerHeightConstraint?.constant = Constants.headerHeight - scrollView.contentOffset.y
            headerImageView.layer.contentsRect = CGRect(x: 0, y: -contentRectOffsetY, width: 1, height: 1)
        }
    }
}



