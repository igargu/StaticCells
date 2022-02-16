import UIKit

class GamePickerViewController: UITableViewController {
    
    let gamesDataSource = GamesDataSource()
    
}

extension GamePickerViewController {
    
    /**
     *  Returns the number of games the data source has
     */
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        gamesDataSource.numberOfGames()
    }
    
    /**
     * creates a cell using the identifier you have set in the storyboard, then sets the text of textLabel to the game’s name
     */
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        cell.textLabel?.text = gamesDataSource.gameName(at: indexPath)
        
        if indexPath.row == gamesDataSource.selectedGameIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension GamePickerViewController {
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let index = gamesDataSource.selectedGameIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        gamesDataSource.selectGame(at: indexPath)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        performSegue(withIdentifier: "unwind", sender: cell)
    }
}
