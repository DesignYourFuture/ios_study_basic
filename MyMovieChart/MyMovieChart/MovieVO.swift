//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by Hamlit Jason on 2021/02/09.
//

import Foundation
/*
 밸류 오브젝트 패턴 - 객체 지향 설계에서는 매우 자주 활용되는 방식으로 데이터 저장을 전담하는 클래스를 별도로 분리하는 방식
 뒤에 VO가 붙음 일반적으로
 */
class MovieVO {
    var thumbnail : String? // 영화 썸네일 이미지 주소
    var title : String? // 영화 제목
    var descriptions : String? // 영화 설명
    var detail : String? // 상세정보
    var opendate : String? // 개봉일
    var rating : Double? // 평점
}
