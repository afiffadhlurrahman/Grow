//
//  LottieViewModel.swift
//  Grow Watch App
//
//  Created by Rangga Yudhistira Brata on 26/04/24.
//

import SwiftUI
import UIKit
import SDWebImageLottieCoder

class LottieViewModel: ObservableObject {
    @Published private(set) var image: UIImage = UIImage(named: "defaultIcon")!
    
    // MARK: - Animation
    
    private var coder: SDImageLottieCoder?
    private var animationTimer: Timer?
    private var currentFrame: UInt = 0
    private var playing: Bool = false
    var speed: Double = 1.0
    var lastFrame: UInt?
    var workoutManager: WorkoutManager = WorkoutManager()
    
    /// Loads animation data
    /// - Parameter url: url of animation JSON
    func loadAnimation(url: URL) {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.setupAnimation(with: data)
            }
        }
        dataTask.resume()
    }
    
    /// Loads animation data from local file
    /// - Parameter filename: name of the local Lottie file
    func loadAnimationFromFile(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        DispatchQueue.main.async {
            self.setupAnimation(with: data)
        }
    }
    
    /// Decodify animation with given data
    /// - Parameter data: data of animation
    private func setupAnimation(with data: Data) {
        coder = SDImageLottieCoder(animatedImageData: data, options: [SDImageCoderOption.decodeLottieResourcePath: Bundle.main.resourcePath!])
        
        // resets to first frame
        currentFrame = 2
        setImage(frame: currentFrame)
        
        print("Sebelum play: \(currentFrame)")
        play()
    }
    
    /// Set current animation
    /// - Parameter frame: Set image for given frame
    private func setImage(frame: UInt) {
        guard let coder = coder,
              let uiImage = coder.animatedImageFrame(at: frame) else { return }
        self.image = uiImage
    }
    
    /// Replace current frame with next one
    private func nextFrame() {
//        guard let coder = coder else { return }
        print(Router.shared.selectedLevelDistance)
        switch UInt(Router.shared.selectedLevelDistance) {
            case 45:
                currentFrame = UInt(ceil(workoutManager.distance / 1))
            case 90:
                currentFrame = UInt(ceil(workoutManager.distance / 2))
            case 135:
                currentFrame = UInt(ceil(workoutManager.distance / 3))
            default:
                print("CurrentFrame = \(currentFrame)")
                currentFrame += 1
        }
        // make sure that current frame is within frame count
        // if reaches the end, we set it back to 0 so it loops
        if currentFrame == lastFrame {
            currentFrame = 0
        } else if currentFrame < 2 {
            currentFrame = 2
        }
        
        setImage(frame: currentFrame)
    }
    
    /// Start playing animation
    private func play() {
        playing = true

        animationTimer?.invalidate()
        print("sebelum timer = \(self.currentFrame)")
        animationTimer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true, block: { (timer) in
            guard self.playing else {
                timer.invalidate()
                return
            }
            print("sebelum next frame = \(self.currentFrame)")
            self.nextFrame()
        })
    }
    
    /// Pauses animation
    private func pause() {
        playing = false
        animationTimer?.invalidate()
    }
}
