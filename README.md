
# 🍿무빌리티(Movielity) - 영화 검색 앱
![넷플릭스-리드미-사진-004](https://github.com/user-attachments/assets/594da009-7c38-4b76-8127-6232b1179daf)

**무빌리티 앱은 TMDB API를 사용해 사용자가 원하는 영화를 검색하고 보관함에 저장하는 영화 리스트 관리 앱입니다.**<br>
**사용자는 즐겨찾는 영화를 손쉽게 검색하고, 즐겨찾기 목록에 추가해 보관할 수 있습니다.**


## 📱 시뮬레이션
| 검색 화면 | 홈 화면 | 상세 화면 | 삭제 화면 |
|---------|-------|---------|---------|
| ![검색 (3)](https://github.com/user-attachments/assets/b71b853d-f064-4983-bdbb-0eab637bf657) | ![랜덤-저장 (1)](https://github.com/user-attachments/assets/bfc6ec92-756d-4ce8-a7b9-67a1d5e9c32a) | ![상세-Realm-저장 (1) (1)](https://github.com/user-attachments/assets/5ac098d9-26fa-43fe-b155-0de84da676e0) | ![realm-삭제 (1)](https://github.com/user-attachments/assets/2ad09a57-e0a2-489a-a943-6f19da0dbb82) |






## ⚙️ 주요 기능
- **TMDB API**를 통한 **영화 정보** 검색
- **검색 기능**: 원하는 영화의 제목이나 정보를 검색
- **즐겨찾기 기능**: 사용자가 좋아하는 영화를 즐겨찾기에 추가 및 관리

## 💻 개발 환경
- **개발 기간**: 2024년 10월 8일 ~ 2024년 10월 14일
- **개발 인원**: 3명
- **개발 도구**:
    - **IDE**: Xcode 15.3
    - **버전 관리**: Git
 
## 🛠️ 기술 스택
- **UI**: `SnapKit` – 제약 조건 기반 인터페이스 구성
- **네트워크**: `Alamofire` – TMDB API와 네트워크 통신
- **데이터베이스**: `RealmSwift` – 즐겨찾기 데이터 저장
- **Reactive Programming**: `RxSwift`, `RxCocoa` – 반응형 데이터 처리 및 이벤트 바인딩

## 📁 디렉토링 구조
```
Movielity
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Base.lproj
│   └── LaunchScreen.storyboard
├── Global
│   ├── Components
│   ├── Extensions
│   ├── Protocols
│   ├── Realm
│   └── Resources
├── Info.plist
├── Network
│   ├── Base
│   ├── Credits
│   ├── Genre
│   ├── NetworkManager.swift
│   ├── Search
│   ├── Similar
│   └── Trending
└── Presentation
    ├── Base
    ├── Detail
    ├── Download
    ├── Home
    ├── Search
    ├── SearchResults
    └── TabBar
```

## 🤔 고민한 부분
- [3개의 API Response값을 갖고 있는 ViewModel](https://github.com/Movielity/Movielity_iOS/wiki/%EA%B3%A0%EB%AF%BC%ED%96%88%EB%8D%98-%EB%B6%80%EB%B6%84_3%EA%B0%9C%EC%9D%98-API-Response%EA%B0%92%EC%9D%84-%EA%B0%96%EA%B3%A0-%EC%9E%88%EB%8A%94-ViewModel)


## 😨 트러블 슈팅
- [HomeViewController 메인 포스터에서 영화와 시리즈 데이터를 결합하는 과정에서 선택된 포스터가 다른 콘텐츠로 연결되는 문제](https://github.com/Movielity/Movielity_iOS/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85_%08HomeViewController%EC%9D%98-%EB%A9%94%EC%9D%B8-%ED%8F%AC%EC%8A%A4%ED%84%B0%EC%97%90%EC%84%9C-%EC%98%81%ED%99%94%EC%99%80-%EC%8B%9C%EB%A6%AC%EC%A6%88-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%A5%BC-%EA%B2%B0%ED%95%A9%ED%95%98%EB%8A%94-%EA%B3%BC%EC%A0%95%EC%97%90%EC%84%9C-%EC%84%A0%ED%83%9D%EB%90%9C-%ED%8F%AC%EC%8A%A4%ED%84%B0%EA%B0%80-%EB%8B%A4%EB%A5%B8-%EC%BD%98%ED%85%90%EC%B8%A0%EB%A1%9C-%EC%97%B0%EA%B2%B0%EB%90%98%EB%8A%94-%EB%AC%B8%EC%A0%9C)
  
- [SearchViewController와 SearchResultsViewController에서의 화면 전환 문제](https://github.com/Movielity/Movielity_iOS/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85_SearchViewController%EC%99%80-SearchResultsViewController%EC%97%90%EC%84%9C%EC%9D%98-%ED%99%94%EB%A9%B4-%EC%A0%84%ED%99%98-%EB%AC%B8%EC%A0%9C)
- [UISearchController의 searchBar를 통해 사용자가 검색어를 입력하는 순간마다 실시간으로 검색 반응 문제](https://github.com/Movielity/Movielity_iOS/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85_%C2%A0UISearchController%EC%9D%98-searchBar%EB%A5%BC-%ED%86%B5%ED%95%B4-%EC%82%AC%EC%9A%A9%EC%9E%90%EA%B0%80-%EA%B2%80%EC%83%89%EC%96%B4%EB%A5%BC-%EC%9E%85%EB%A0%A5%ED%95%98%EB%8A%94-%EC%88%9C%EA%B0%84%EB%A7%88%EB%8B%A4%C2%A0%EC%8B%A4%EC%8B%9C%EA%B0%84%EC%9C%BC%EB%A1%9C-%EA%B2%80%EC%83%89-%EB%B0%98%EC%9D%91-%EB%AC%B8%EC%A0%9C)

## 🧑‍⚖️ Github Convention
- **Commit**: `[FEAT/#33] 액션 버튼 구현`
- **Branch** : `feat/#33-main-view-ui`
- **Issue** : `[FEAT] 메인 뷰 UI 구현`
- **PR** : `[PR/#33] 메인 뷰 UI 구현`
- **Merge** : `[MERGE/#33(이슈 번호)] -> develop`
