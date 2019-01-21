# 팀내 코딩 규칙

코딩 컨벤션 
https://github.com/StyleShare/swift-style-guide
https://github.com/raywenderlich/swift-style-guide

1.코드를 주로 이용하되 스토리보드에 반영할 수 있도록 구성 /b
guard let return 시 return 할 것이 있으면 엔터 없으면 { return }
변수 초기화 var array: [Int] = []
self, types 추론 가능한것 안쓰기
self 옵셔널 되면 guard let 으로 빼기
상속을 줄이고 프로토콜로 대체, MVC패턴 사용
UI객체들 내용 + 해당 객체 이름으로 정한다. ex ) label 은 내용 + Label을 붙인다 
함수의 경우 구체적은 동작을 정의한다 loginButtonDidTap
delegate / dataSource extension으로 나누어 구현
return .init()
