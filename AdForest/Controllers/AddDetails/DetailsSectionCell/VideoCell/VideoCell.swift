//
//  VideoCell.swift
//  AdForest
//
//  Created by Loyal Lauzier on 1/17/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoCell: UITableViewCell {

    @IBOutlet weak var viewForVideo: UIView!
    @IBOutlet weak var btnPlay: UIButton!

    let controller = AVPlayerViewController()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        selectionStyle = .none
        controller.view.frame = self.viewForVideo.frame
        self.viewForVideo.addSubview(controller.view)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didPlayToEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onBtnPlayTapped(_ sender: Any) {
        guard let player = controller.player else {return}
        
        if player.timeControlStatus == .playing {
            player.pause()
            self.btnPlay.isHidden = false
        } else if player.timeControlStatus == .paused {
            player.play()
            self.btnPlay.isHidden = true
        }
    }
    
    @objc func didPlayToEnd() {
        guard let player = controller.player else {return}
        
        player.seek(to: CMTimeMakeWithSeconds(0, 1))
        self.btnPlay.isHidden = false
    }
    
}
