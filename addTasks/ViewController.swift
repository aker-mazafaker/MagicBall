//
//  ViewController.swift
//  addTasks
//
//  Created by Akerke on 14.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "AskMe"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    let answerImages = [
        UIImage(named: "ask_again"),
        UIImage(named: "i_have_no_idea"),
        UIImage(named: "no"),
        UIImage(named: "yes"),
        UIImage(named: "yes1"),
    ]
    
    private lazy var imageView: UIImageView = {
           let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        imageView.image = UIImage(named: "8")
           imageView.contentMode = .scaleAspectFit
           imageView.animationImages = answerImages as? [UIImage]
           imageView.animationDuration = 1.0
           imageView.animationRepeatCount = 0
           return imageView
       }()
    
    let askButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.tintColor = .black
        button.setTitle("ASK", for: .normal)
        button.addTarget(self, action: #selector(askButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScene()
        makeConstraints()
        addAnimation()
    }
}

extension ViewController {
    func setupScene() {
        view.addSubview(topLabel)
        view.addSubview(askButton)
        view.addSubview(imageView)
    }
    
    func makeConstraints() {
        topLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-300)
        }
        askButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(200)
        }
        imageView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(askButton).offset(-200)
        }
    }
    
    func addAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat]) {
            self.imageView.alpha = 0
           self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

        }
    }

    @IBAction func askButtonTapped(_ sender: Any) {
            let randomInt = Int.random(in: 0..<5)
            
            guard let image = answerImages[randomInt] else {
                print("нет картинки \(randomInt)")
                return
            }
        imageView.image = image
        }
    }
    

