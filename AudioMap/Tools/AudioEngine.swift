//
//  AudioEngine.swift
//  AudioMap
//
//  Created by Admin on 16.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation
import AudioKit
protocol AudioEngineDelegate: class {
    func newDataAdded(freq: Double, amp: Double)
}

class AudioEngine {
    static let shared = AudioEngine()
    
    weak var delegate: AudioEngineDelegate?
    
    var mic: AKMicrophone!
    var booster: AKBooster!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var tap: AKFFTTap?
    var mixer: AKMixer
    var timer: Timer?
    

    private init() {
        
        AKSettings.audioInputEnabled = true
        AKSettings.sampleRate = AudioKit.engine.inputNode.inputFormat(forBus: 0).sampleRate
        // Shared by SPL + RTA
        mic = AKMicrophone()
        booster = AKBooster(mic)
        tracker = AKFrequencyTracker(booster)
        silence = AKBooster(tracker, gain: 0)
        // Tap for RTA
        tap = AKFFTTap(booster)
        
        mixer = AKMixer([silence])
        AudioKit.output = mixer
        
    }
    
    deinit {
    }
    
    @objc public func stop() {
        do{
            try AudioKit.stop()
            if let timer = timer {
                timer.invalidate()
            }
        } catch {
            print("AudioKit Stop Failed")
        }
    }
    
    @objc public func start() {
        do{
            try AudioKit.start()
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.tick), userInfo: nil, repeats: true)
        } catch {
            print("AudioKit Start Failed")
        }
    }
    @objc func tick(){
        
        delegate?.newDataAdded(freq: tracker.frequency, amp: tracker.amplitude)
    }
}
