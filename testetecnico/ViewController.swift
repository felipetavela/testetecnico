import UIKit

class ViewController: UIViewController {

    var playerVC: PlayerViewModel!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelPos: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var percentualLabel: UILabel!
    
    @IBOutlet weak var copasVencidas: UIProgressView!
    @IBOutlet weak var vencidasPosition: UILabel!
    @IBOutlet weak var copasDisputadas: UIProgressView!
    @IBOutlet weak var disputadasPosition: UILabel!
    
    @IBOutlet weak var percentualView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        percentualView.layer.cornerRadius = 31
    }
    
   
    func setup() {
        
        let url: URL = URL(string: "http://sportsmatch.com.br/teste/teste.json")!

        Webservice().getData(url: url) { player in
            
            self.playerVC = PlayerViewModel(player: player!)
            
            DispatchQueue.main.async {
            self.labelName.text = self.playerVC.name
            self.labelCountry.text = self.playerVC.country
            self.labelPos.text = self.playerVC.pos
            self.percentualLabel.text = String(self.playerVC.percentual)
            
            let url = URL(string: self.playerVC.img)
            let data = try? Data(contentsOf: url!)
            self.imageView.image = UIImage(data: data!)
            
            self.vencidasPosition.text = String(self.playerVC.barras.copasDoMundoVencidas.pos)
            self.disputadasPosition.text = String(self.playerVC.barras.copasDoMundoDisputadas.pos)
                
                self.copasVencidas.progress = self.playerVC.barras.copasDoMundoVencidas.pla / self.playerVC.barras.copasDoMundoVencidas.max
            
                self.copasDisputadas.progress =
                self.playerVC.barras.copasDoMundoDisputadas.pla / self.playerVC.barras.copasDoMundoDisputadas.max
    
        }
    }
}
}
