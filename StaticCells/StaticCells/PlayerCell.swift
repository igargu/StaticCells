import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    /**
     *  Property of type Player. Executed when its value is set
     */
    var player: Player? {
        didSet {
            guard let player = player else { return }
            
            gameLabel.text = player.game
            nameLabel.text = player.name
            ratingImageView.image = image(forRating: player.rating)
        }
    }
    
    /**
     *  Method to fetch the appropriate image based on the rating of the player
     */
    private func image(forRating rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
