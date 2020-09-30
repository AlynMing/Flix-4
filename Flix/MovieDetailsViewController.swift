//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Taha Afzal on 9/28/20.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    var movie: [String:Any]!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = "https://image.tmdb.org/t/p/"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + "w780" + posterPath)
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: baseURL + "w1280" + backdropPath)
        var releaseYear = movie["release_date"] as? String
        releaseYear = String(releaseYear!.prefix(4))
        var language = movie["original_language"] as? String
        language = language?.uppercased()
        
        backdropView.af.setImage(withURL: backdropURL!)
        posterView.af.setImage(withURL: posterURL!)
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        releaseYearLabel.text = releaseYear
        languageLabel.text = language
        overviewLabel.text = movie["overview"] as? String
        overviewLabel.sizeToFit()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
