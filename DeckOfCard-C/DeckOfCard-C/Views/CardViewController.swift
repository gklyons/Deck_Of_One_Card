//
//  CardViewController.swift
//  DeckOfCard-C
//
//  Created by Garrett Lyons on 3/24/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

   
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawCardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCards()

    }

    @IBAction func drawCardButtonTapped(_ sender: Any) {
        self.fetchCards()
    }

    func fetchCards() {
        CardController.drawNewCard(1) { (cards) in
            if let cards = cards {
                CardController.fetchCardImage(cards[0]) { (cardImage) in
                    DispatchQueue.main.async {
                        if let cardImage = cardImage {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    func updateViews(card: Card, image: UIImage) {
        self.cardImageView.image = image
        self.suitLabel.text = card.suit
    }
}
