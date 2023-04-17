//
//  ViewController.swift
//  ApiImagaButton
//
//  Created by Ваня Науменко on 17.04.23.
//

import UIKit

// MARK: - ViewController

class ViewController: UIViewController {
    
    var imageWidth = ""
    var imageHeigth = ""
    
    @IBOutlet var imageImage: UIImageView!

    @IBAction func buttonImage(_ sender: Any) {
        // 1) Пoлучаем API
        let url = "https://picsum.photos/" + imageWidth + "/" + imageHeigth
        // 2) Создание URL
        guard let apiURL = URL(string: url) else {
            fatalError("some Error")
        }
        // 3) Инициализировать сессию
        let session = URLSession(configuration: .default)
        // 4) Создать запрос dataTask
        let task = session.dataTask(with: apiURL) {(data, response, error) in
        // 5) Обработать полученные данные
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageImage.image = UIImage(data: data)
            }
        }
        // Запустить запрос
        task.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = imageImage.bounds.height
        self.imageHeigth = String(format: "%.0f", Double(height))
        let width = imageImage.bounds.width
        self.imageWidth = String(format: "%.0f", Double(height))

    }
}
