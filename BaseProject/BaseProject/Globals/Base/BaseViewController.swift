//
//  BaseViewController.swift
//  BaseProject
//
//  Created by taehy.k on 2021/07/31.
//

import UIKit

// MARK: - 프로젝트 내 커스텀 뷰 컨트롤러가 상속받는 기본 뷰 컨트롤러
// 각 뷰 컨트롤러 별로 공통적으로 사용되는 부분들이 분명히 있을 것이다.
// 해당 내용들은 상속받을 BaseViewController에 작성해놓는 것이 중복되는 코드 라인 수를 줄일 수 있을 것이다.
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
    
    // UI 관련
    // - 모든 곳에 사용되는 공통적인 요소는 이곳에 작성한다.
    // - 각각의 뷰컨트롤러의 UI Set에 관련된 요소는 해당 함수를 오버라이딩해서 작성하도록 한다.
    func setupUI() {
        // MARK: 아래 예시들처럼 상황에 맞게 활용하시면 됩니다.
        // Navigation Bar
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 16, weight: .semibold)
        ]
        // Background Color
        self.view.backgroundColor = .white
        
        print("super setupUI() called.")        // 오버라이딩 시, super.setupUI()를 해주어야 이곳에서 설정한 내용들이 적용됨.
    }
    
    /// 레이아웃 관련
    /// - 레이아웃을 잡을 필요가 있을 경우에 해당 메서드를 오버라이딩해서 사용한다.
    func setupConstraints() {
        // override point
    }
}
