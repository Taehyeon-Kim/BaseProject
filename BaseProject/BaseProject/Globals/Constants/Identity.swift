//
//  Identity.swift
//  BaseProject
//
//  Created by taehy.k on 2021/07/31.
//

/*
 - Name, Identifier와 관련된 내용을 하나로 관리
 - Constants로 관리안하고 Extension으로 처리할 수 있는 방법은 없을까?
 */

import Foundation

// MARK: - Identity
extension Constants {
    
    // MARK: - ViewController
    struct ViewController {
        
        struct Identifier {
            // example: static let main = "MainViewController"
        }
    }
    
    // MARK: - Storyboard
    struct Storyboard {
        
        struct Name {
            // example: static let main = "MainStoryboard"
        }
    }
    
    // MARK: - Xib
    struct Xib {

        struct Name {
            // example: static let sampleTableViewCell = "SampleTableViewCell"
        }
        
        struct Identifier {
            // example: static let sampleCollectionViewCell = "SampleCollectionViewCell"
        }
    }
}
