//
//  MovieViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var imgChangePlayButton: UIButton!
    @IBOutlet var infomationLabel: UILabel!
    @IBOutlet var secondImgView: UIImageView!
    @IBOutlet var thirdImgView: UIImageView!
    
    let secondMovieImgArr: [String] = ["도둑들", "극한직업", "명량", "베테랑", "부산행","신과함께인과연"]
    let thirdMoiveImgArr: [String] = [ "신과함께죄와벌", "아바타", "알라딘","암살", "해운대"]
    let MainMovieImgArr: [String] = ["어벤져스엔드게임","태극기휘날리며", "택시운전사","왕의남자"]
    
    //MARK: - viewDidLoad
    //사용자에게 화면이 보이기 직전에 실행되는 부분
    //모서리 둥글기, 그림자 등 스토리보드에서 설정할 수 없는 UI를 설정할 때 주로 사용
    //뷰컨트롤러 생명주기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showRandomMovie()
        setImgView(outletName: firstImageView, borderColor: UIColor.yellow.cgColor)
        setImgView(outletName: secondImgView, borderColor: UIColor.green.cgColor)
        setButton()
        setImgView(outletName: thirdImgView, borderColor: UIColor.green.cgColor)
    }
    
    //MARK: - IBAction
    @IBAction func tappedPlayButton(_ sender: UIButton) {
        showRandomMovie()
    }
    
    
    //MARK: - showRandomMovie
    func showRandomMovie() {
        //        var randomImg = Int.random(in: 1...5)
        //        firstImageView.image = UIImage(named: "\(randomImg)")
                let random = [1, 2, 3, 4, 5]
                let randomResult = random.randomElement()!
                firstImageView.image = UIImage(named: "\(randomResult)")
        secondImgChange()
        thirdImgChange()
        mainImgchange()
    }
    
    //MARK: - setUI functions
    
    //outletName: 외부 매개변수(Argument Label : 함수 매개변수명 앞에 작성)
    //name: Parameter - 내부 매개변수(Parameter Name : 함수 매개변수명) ->
    //전달 인자: Argument - 함수를 호출할 때 전달하는 값(시시각각 변동됨)
    
    func setImgView(outletName name: UIImageView, borderColor: CGColor){
        name.layer.cornerRadius = 35
        name.layer.borderWidth = 3
        name.layer.borderColor = borderColor
        name.contentMode = .scaleAspectFit
        name.backgroundColor = .blue
    }
    
    
    func setButton(){
        //        imgChangePlayButton.setTitle("재생", for: .normal)
        //        imgChangePlayButton.setTitle("눌러주세요", for: .highlighted)
        //        imgChangePlayButton.setTitleColor(.black, for: .normal)
        //                imgChangePlayButton.setTitleColor(.red, for: .highlighted)
                
                imgChangePlayButton.setImage(UIImage(named: "play_normal"), for: .normal)
                imgChangePlayButton.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        
                imgChangePlayButton.layer.cornerRadius = 10
                imgChangePlayButton.layer.borderColor = UIColor.red.cgColor
                imgChangePlayButton.layer.borderWidth = 2
    }
        
    
    //MARK: - tappedLikeButton
    @IBAction func tappedLikeButton(_ sender: UIButton) {
        //1. 알림 컨트롤러 생성
        let alert = UIAlertController(title: "알림", message: "곧 만나요!", preferredStyle: .alert)
        //2. 알림 버튼 생성(Action)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let check = UIAlertAction(title: "확인", style: .default)
        
        //3. 컨트롤러에 액션 삽입
        alert.addAction(cancel)
        alert.addAction(check)
        
        //4.프레젠트
        self.present(alert, animated: true)
    }
    
    //MARK: - tappedSaveButton
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        
    }
    //MARK: - ChangeImg
    func secondImgChange(){
        let randomElement = secondMovieImgArr.randomElement()!
        secondImgView.image = UIImage(named: randomElement)
    }
    
    
    func thirdImgChange(){
        let randomResult = thirdMoiveImgArr[Int.random(in: 0...thirdMoiveImgArr.count - 1)]
        thirdImgView.image = UIImage(named: randomResult)
    }
    
    func mainImgchange(){
        let randomElement = MainMovieImgArr.randomElement()!
        mainImageView.image = UIImage(named: randomElement)
    }
}
