//
//  AgreementTableView.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 14/11/2024.
//

import SwiftUI
import UIKit

class TransactionCell: UITableViewCell {

    
    var imageWidthAnchor:NSLayoutConstraint?
    


    func configure(withModel: Transaction) {
//        IbanLabel.text = withModel.accountNumber
//        accountLabel.text = withModel.accountHolderName
//        balanceLabel.attributedText = withModel.convertedCurrency.attributedValue
//        
//
//        selectedBackgroundView = UIView()
//        IconImage.image = UIImage(systemName: icon)
//        IconImage.isHidden = false
//        imageWidthAnchor?.isActive = false
//        imageWidthAnchor = IconImage.widthAnchor.constraint(lessThanOrEqualToConstant: 24)
        SetupConstraints()

    }

    lazy var bg: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lucas Schilperoort:"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    var IbanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NL84 INGB 1234 5678 90:"
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()

    var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$ 123,45"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    var IconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .orange
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bg)
        bg.addSubview(accountLabel)
        bg.addSubview(IbanLabel)
        bg.addSubview(balanceLabel)
        bg.addSubview(IconImage)
        IconImage.isHidden = true
        imageWidthAnchor = IconImage.widthAnchor.constraint(lessThanOrEqualToConstant: 0)
        SetupConstraints()

        bg.layer.cornerRadius = 10

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            bg.backgroundColor = .systemGray5
            backgroundColor = .systemGray5
        } else {
            bg.backgroundColor = .white
            backgroundColor = .white
        }

    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            bg.backgroundColor = .systemGray5
            backgroundColor = .systemGray
        } else {
            bg.backgroundColor = .white
            backgroundColor = .white
        }
    }

    func SetupConstraints() {
        NSLayoutConstraint.activate([
            bg.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            bg.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            bg.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            bg.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bg.heightAnchor.constraint(equalToConstant: 80),
            IconImage.leftAnchor.constraint(
                equalTo: bg.layoutMarginsGuide.leftAnchor),
            IconImage.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
            IconImage.rightAnchor.constraint(equalTo: accountLabel.leftAnchor, constant: -15),
            imageWidthAnchor!
            ,
            accountLabel.leftAnchor.constraint(
                equalTo: IconImage.rightAnchor, constant: 0),
            accountLabel.topAnchor.constraint(
                equalTo: bg.layoutMarginsGuide.topAnchor, constant: 10),
            IbanLabel.leftAnchor.constraint(equalTo: accountLabel.leftAnchor),
            IbanLabel.topAnchor.constraint(
                equalTo: accountLabel.bottomAnchor, constant: 10),
            balanceLabel.leftAnchor.constraint(equalTo: IbanLabel.rightAnchor, constant: 20),
            balanceLabel.rightAnchor.constraint(greaterThanOrEqualTo: bg.rightAnchor, constant: -20),
            balanceLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
        ])
    }
}

#Preview {
    let view = TransactionCell()
    // adding width constraint for preview only, to make it look like it would in tableView
    view.bg.widthAnchor.constraint(equalToConstant: 400).isActive = true
    return view
}
