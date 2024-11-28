//
//  AgreementTableViewFooter.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 19/11/2024.
//

import UIKit

class AgreementTableViewHeader: UITableViewHeaderFooterView {
    
    let title = UILabel()
    
    var icon:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .orange
        return imageView
    }()


      override init(reuseIdentifier: String?) {
          super.init(reuseIdentifier: reuseIdentifier)
          configureContents()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

      func configureContents() {
          contentView.translatesAutoresizingMaskIntoConstraints = false
          title.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview(title)
          contentView.addSubview(icon)
          contentView.backgroundColor = .white
          title.font = .systemFont(ofSize: 28, weight: .semibold)
          title.textColor = .orange
          NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalTo: title.heightAnchor, multiplier: 1.5),
            title.leadingAnchor.constraint(equalTo:
                                            contentView.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
          ])
      }
    
    
}
