import Foundation

struct PlayerViewModel {
    
    let player: Player
}

extension PlayerViewModel {
    
    init(_ player: Player) {
        self.player = player
    }
}

extension PlayerViewModel {
    
    var img: String {
        return self.player.img
    }
    
    var name: String {
        return self.player.name
    }
    var percentual: Double {
        return self.player.percentual
    }
    var pos: String {
        return self.player.pos
    }
    
    var country: String {
        return self.player.country
    }
    var barras: Barras {
        return self.player.barras
    }

}
