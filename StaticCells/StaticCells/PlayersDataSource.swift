import UIKit

class PlayersDataSource: NSObject {
 
  var players: [Player]

  static func generatePlayersData() -> [Player] {
    return [
      Player(name: "Pepe Pepín", game: "Tic-Tac-Toe", rating: 4),
      Player(name: "Ana Anita", game: "Spin the Bottle", rating: 5),
      Player(name: "Manolo Manolín", game: "Texas Hold 'em Poker", rating: 2)
    ]
  }

  override init() {
    players = PlayersDataSource.generatePlayersData()
  }

  func numberOfPlayers() -> Int {
    players.count
  }

  func append(player: Player, to tableView: UITableView) {
    players.append(player)
    tableView.insertRows(at: [IndexPath(row: players.count-1, section: 0)], with: .automatic)
  }

  func player(at indexPath: IndexPath) -> Player {
    players[indexPath.row]
  }
}

