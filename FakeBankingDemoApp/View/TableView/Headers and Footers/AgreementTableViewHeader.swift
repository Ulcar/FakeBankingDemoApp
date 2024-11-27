//
//  AgreementTableViewFooter.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 19/11/2024.
//

import UIKit

class AgreementTableViewHeader: UITableViewHeaderFooterView {
    
    let title = UILabel()


      override init(reuseIdentifier: String?) {
          super.init(reuseIdentifier: reuseIdentifier)
          configureContents()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

      func configureContents() {
          title.translatesAutoresizingMaskIntoConstraints = false


          contentView.addSubview(title)
          contentView.backgroundColor = .white
          
          title.font = .preferredFont(forTextStyle: .headline)
          title.textColor = .red


          NSLayoutConstraint.activate([
          
              // Center the label vertically, and use it to fill the remaining
              // space in the header view.
              title.heightAnchor.constraint(equalToConstant: 60),
              title.leadingAnchor.constraint(equalTo:
                                                contentView.layoutMarginsGuide.leadingAnchor),
              title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
          ])
      }
    
    
}
