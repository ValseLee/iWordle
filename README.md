# iWordle
🎮 Wordle을 만들어봅니당
---
### 1. 왜 하는가?

매너리즘에 빠진 나의 개발 습관을 바꾸고 싶었다.   
혼자 더 주도적으로 개발할 수 있는 게 뭐가 있을까 고민하다가 `Wordle` 이라는 미니 게임이 생각났다.   
꽤 많은 개발자가 토이프로젝트 형태로 재현하는 걸 보기도 했고, 나도 해보고 싶었다.   

### 2. 어떻게 할 건가?

~당연히 열심히 한다~.  
이걸 고민하면서 시작하는 게 맞는지 모르겟는데, `VIPER` 아키텍쳐를 써보고 싶다.
이유는 이렇다.

1. Wordle 게임에는 동일한 뷰가 여러 차례 반복 되는 경우가 많기 때문에, `Router`를 가진 VIPER 아키텍쳐가 적합할 것 같다.
2. 작성할 기반 코드가 많은 걸로 아는데, **오히려 좋다.**
- 그래서 따로 프레임워크는 쓰지 않을 예정
3. MVC, MVVM 은 맛본 적이 있으니, VIPER 찍먹이라도 해보자.
- 하다가 맞지 않는다 싶으면 가차없이 변경할 계획이다.
- 아직 익숙하지 않으니까 처음부터 VIPER로 짜기보다 막 짜다가 리팩토링 하는 느낌으로
4. 아 그리고, 기능 별로 브랜치 따서 개발해보는 습관도 들여보고 싶다.
- 해본 적이 없어서 잘 될지는 모르겠다.
5. 전부 '코드로만' 하는 프로젝트를 혼자 해봐야 손에 익을 것 같아서 한다.

---

### 3. 경과

- **22.08.11.**   
콜렉션뷰와 콜렉션뷰셀을 뷰컨에 넣고 화면에 띄울 수 있었다.   
그런데 `UICollectionView(frame:)`으로 생성하는 바람에 콜렉션뷰 자체의 크기 조정이 어렵다.   
레이웬더리치에서 UICollectionView Tutorial을 찾았으니 활용해서 공부해보자.

- 이어서 해야할 일
- [x]  콜렉션뷰셀 정렬하기 - 22.08.12.
- [ ]  콜렉션뷰 `frame` 조정하기

---

- **22.08.12.**   
첫 화면에서 넘긴 GameViewController에 게임용 단어를 넣을 뷰를 만들었다.   
원하던대로 각 셀을 한 줄에 5개씩, 총 25개가 한 화면에 나오도록 정렬했다.   
문제는 단어화면뷰랑 그 밑에 위치할 CollectionView가 자꾸 겹친다.   
해결해 보려고 2시간을 넘게 끙끙 거렸는데, 아직 하지 못했다..   

- **문제 해결을 위해 했던 시도**
  - UIView를 하나 더 만들어서 그 안에 콜렉션뷰를 넣어버리고 뷰컨에서 불러오기
    - 아쉽게도 해결되지 않았다. 오히려 델리게이트 설정만 복잡해져버려서 폐기
  - 새로 만든 단어화면뷰 하단 Anchor를 기준으로 콜렉션뷰의 레이아웃 지정하기
    - 이게 왜 안되는지 잘 모르겠다. 단어화면뷰를 **콜렉션뷰가 잡아먹어버린다.**
    - 레이아웃만 조정하는 단 하나의 코드가 추가됐을 뿐인데.. 왜 이렇게 되는지 조사가 필요하다
    <img width="408" alt="스크린샷 2022-08-12 오후 11 18 31" src="https://user-images.githubusercontent.com/82270058/184372773-1851462f-f896-4086-890e-a5652ba6800c.png"> <img width="410" alt="스크린샷 2022-08-12 오후 11 19 14" src="https://user-images.githubusercontent.com/82270058/184372948-17fd7d31-8b5c-4d9d-a944-8bc315cf28e1.png">

- 한 일
- [x]  콜렉션뷰셀 정렬

- 해야할 일
- [ ]  단어화면뷰와 게임화면뷰 제대로 레이아웃
- [ ]  레이아웃에 맞춰서 콜렉션뷰 `frame` 조정하기
- [ ]  파일 이름들 제대로 정리하기

---

- **22.08.13.**   
단어화면뷰랑 콜렉션뷰를 한 뷰에 그리는 게 걱정이었는데, 어이없을 정도로 쉽게 해결했다.   
애초에 `frame` 사이즈를 정해둔 채로 오토레이아웃을 다시 잡으려 했으니 두 제한이 충돌이 난 것으로 보인다.
이제 한 화면에서 컬렉션뷰셀과 단어가 동시에 보여진다.   
<img width="417" alt="스크린샷 2022-08-13 오후 11 18 12" src="https://user-images.githubusercontent.com/82270058/184498210-b44294b2-ff82-4c87-aac7-8d95821f1719.png"><img width="415" alt="스크린샷 2022-08-13 오후 11 18 58" src="https://user-images.githubusercontent.com/82270058/184498236-7071aded-a3f9-4d08-8032-92179cbfe1cd.png">   

오늘은 꽤 진도를 나갈 수 있었다.    
현재까지는 각 셀에 한 개의 글자만 넣을 수 있게 구현이 된 상태고, 입력된 후에는 다시 수정할 수 없도록 해놓았다.   
나중에 일괄적으로 단어를 지울 수 있도록 삭제 버튼을 만들 예정이다.   
이제 델리게이트 패턴을 써서 각 셀의 `indexPath.row`를 받고, 그 숫자와 stringIndex의 위치를 비교해서 셀을 다시 그려주면 된다.   
내부 로직을 구현해야 하는 단계가 남아서 이제부터 좀 속도가 더뎌질 것 같다.   

- 한 일
- [x]  콜렉션뷰 UI 구성
- [x]  파일 이름 정리
- [x]  `UIView` 확장에서 `setAnchor()`를 조금 더 쓰기 편하도록 열거형으로 정리(친구가 많이 도와줌)

- 해야할 일
- [ ]  wordle 단어를 **FAST API**로 받아오기
  - 경우에 따라 `alamofire`를 써야 한다고 하는데... 난관이 예상된다..
- [ ]  내부 정보 처리 로직 구성하기
  - [ ]  유저가 입력한 글자 받아오기
  - [ ]  받아온 글자와 정답 글자 비교하기
  - [ ]  위치와 인덱스에 따라 셀 컬러 바꿔주기
  - [ ]  ⚠️콜렉션뷰셀과 텍스트뷰와 콜렉션뷰의 델리게이트가 어떻게 되는지 파악하기

---

- **22.08.14.**   
Wordle 단어 리스트 API를 찾았다고 생각했었는데 내가 생각했던 것이랑 달랐다.   
내장 모듈처럼 활용하는 꼴이었는데, 너무 돌아가는 길이 될 것 같았다.   
대신 [깃헙](https://github.com/tabatkins/wordle-list)에 올라와있던 단어 리스트를 활용하기로 했다.   
![스크린샷 2022-08-14 오후 9 18 16](https://user-images.githubusercontent.com/82270058/184536504-9a9a6e75-a569-4835-9b85-00ce2790fe35.png)   

`dump()`로 값이 아주 잘 찍히는 걸 볼 수 있다!   
처음엔 `\n`를 포함한 하나의 스트링으로 리턴되어서 후처리를 했다.   
결과 타입과 콜백 함수로 뷰컨에서도 확인이 가능하다.   
뿌듯하군.  

이제 내부에 단어를 받아왔으니.. 사실상 `Firebase`는 필요없게 됐다.   
내부 채점 로직을 완성해두고, 유저가 원하는 단어를 업로드 할 수 있게 해볼까 싶다.   

- 한 일 
- [x]  wordle 단어를 API로 받아오기

- 해야할 일
- [ ]  내부 정보 처리 로직 구성하기
  - [ ]  유저가 입력한 글자 받아오기
  - [ ]  받아온 글자와 정답 글자 비교하기
  - [ ]  위치와 인덱스에 따라 셀 컬러 바꿔주기
  - [ ]  ⚠️콜렉션뷰셀과 텍스트뷰와 콜렉션뷰의 델리게이트가 어떻게 되는지 파악하기
  
---

- **22.08.16.**   
API 로 받아오는 단어와 유저가 입력하는 단어를 비교하는 단계까지 왔다.   
아쉽게도 아직 인덱스를 끌어오는 델리게이트 패턴 구현은 못 하고 있다..   
스택오버플로우를 방황하다보니 이런 [게시글](https://stackoverflow.com/questions/43143119/swift-uicollectionview-textfields)을 발견해서 내일은 이걸 시도해볼 예정이다.   
   
API 단어가 파싱되기도 전에 다음 뷰컨으로 넘어가버리고 그랬는데, `JDProgressHUD`를 추가해서 가시성이랑 버그를 함께 잡았다.   
`Words` 구조체를 제대로 정리해서 내부 단어 비교 로직 틀을 좀 잡아야겠다.   

- 한 일   
- [x]  `JDProgressHUD`를 추가   
- [x]  뷰컨 이동 전에 단어 파싱이 완료되도록 조치   
- [x]  API 단어와 유저 단어를 하나의 구조체에서 비교하는 초석 마련   

- 해야할 일
- [ ]  내부 정보 처리 로직 구성하기
  - [ ]  받아온 글자와 정답 글자 비교하기
  - [ ]  각 글자의 위치와 인덱스에 따라 셀 컬러 바꿔주기
  - [ ]  콜렉션뷰셀과 텍스트뷰, 콜렉션뷰의 델리게이트 파악하기
  
---

- **22.08.17.**   

커스텀 델리게이트 패턴을 구현해서 콜렉션 뷰 내의 콜렉션 뷰셀의 텍스트필드의 이벤트를 받아올 수 있게 됐다.   
델리게이트는 정말 많이 쓰이는 패턴인데, 텍스트필드에 `addTarget(_:action:for:)`을 활용해서 텍스트 편집이 끝나는 이벤트를 전달하고 호출할 수 있었다.   
커스텀 델리게이트를 활용해서 콜렉션뷰셀의 크기도 줄일 수 있을 것으로 기대된다.   
어제 발견한 스택오버플로우 게시글이 진짜 큰 도움이 됐다.   
이 문제 해결 관련해서는 벨로그에 따로 정리를 해서 나중에도 커스텀 델리게이트에 써먹어야 겠다.   

이제 콜렉션뷰를 관리하는 뷰컨에서 텍스트필드의 변화도 알 수 있으니, 이걸 활용해서 단어를 비교하여 UI를 바꾸면 대략적인 기능 구현은 마무리 될 것 같다.   

- 한 일
- [x] 콜렉션뷰셀과 텍스트뷰, 콜렉션뷰의 커스텀 델리게이트 구현하기

- 해야할 일
- [ ]  내부 정보 처리 로직 구성하기
  - [ ]  받아온 글자와 정답 글자 비교하기
  - [ ]  각 글자의 위치와 인덱스에 따라 셀 컬러 바꿔주기
- [ ]  벨로그에 커스텀 델리게이트 패턴 정리해두기

---

- **22.08.22.** 

꽤 긴 시간 동안 코딩이랑 떨어져 지냈다.   
휴가도 다녀오고, 가족 일도 도와주고 왔다.   

커스텀 델리게이트 패턴을 써서 객체 소통을 구현했는데, 생각보다 데이터를 전달하는 데에 애로사항이 많았다.   
무엇보다 델리게이트로는 일대다 정보 전달이 되지 않는다.   
그래서 브랜치 따고 옵져버 패턴으로 새로 구현했다.   
브랜치를 활용하니까 코드를 지우고 새로 쓰는 거에도 더 자유로워져서 좋다!   
암튼 이제 다른 객체에서의 데이터도 잘 전달되고 있다.   

`indexPath`와 글자 인덱스를 비교하고 포함 관계까지 정리하면 채점 로직은 구현될 것이다.   
관련 정보를 처리하고 나면 `View`에서 UI를 새로 그린다.   
그런데 `interactor`가 제대로 그 역할을 하고 있는지 의심스럽다.   
채점 로직을 구현하면서 `interactor`쪽에 손을 많이 댈 것 같다.   

- 한 일
- [x]  벨로그에 커스텀 델리게이트 패턴 정리
- [x]  옵져버 패턴으로 데이터 전달 구조 새로 구현

- 해야할 일 
- [ ]  내부 정보 처리 로직 구성하기
  - [ ]  받아온 글자와 정답 글자 비교하기
  - [ ]  각 글자의 위치와 인덱스에 따라 셀 컬러 바꿔주기

---

- **22.08.23.**

싱글톤 패턴에 대한 고민이 많았다.   
싱글톤이 남발되면 여러 객체가 무분별하게 싱글톤 인스턴스에 접근하게 되고, 이는 그 자체로 OOP와 거리가 먼 태도라 할 수 있다.   
그런데 당장 의존성 주입 패턴을 써보자니.. 뭔가 처음부터 단추를 잘못 끼웠다는 생각이 든다.   
일단 마음 속에 담아두었던 기한인 8월 31일까지 완성을 목표로 해보자.   

오늘은 채점 로직을 구현했다.   
그와 별개로 삽질을 좀 많이 한 것 같아서 아쉽다.   
작업을 하면서 해야할 목록이 늘어나기도 한다.   
1. 정답에 해당하는 글자를 담은 cell의 배경색 바꾸는 방법 확인하기
2. 이전 줄에 글자를 입력하지 않으면 다음 줄 글자를 입력하지 못하도록 하기
  - 이건 생각을 좀 해봤는데, 처음 5개의 `cell`만 보여주는 건 어떨까 했다.   
  그런데 아쉽게도 이렇게 하면 `cell`의 위치가 다시 섞이기 때문에 무척 난감하다.

벨로그에 면접 문제를 정리하는 공부도 함께 하고 있다.

- 한 일
- [x]  벨로그에 NotificationCenter, Dependency Injection 내용 정리
- [x]  받아온 글자와 정답 글자를 비교하는 채점 로직 구현 

- 해야할 일
- [ ]  내부 정보 처리 로직 구성하기
  - [ ]  각 글자의 위치와 인덱스에 해당하는 셀 컬러 바꾸기
  - [ ]  각 줄에 순서대로 글자를 입력하도록 하기
- [ ]  문제를 다 풀이하고 나면 `reset` 버튼 만들고 처음 상태로 초기화 하기

---

- **22.08.24.**

오늘은 카페에서 코딩을 했다.   
집중이 평소보다 더 잘 되어서 기분이 썩 괜찮았다.   
싱글톤 패턴에 대한 고민은 의존성 주입과 관련이 컸었다.   
내 방식이 맞다곤 못하겠지만 여러 뷰 컨트롤러 객체가 하나의 싱글톤 객체에 접근하는 상황은 방지하도록 했다.   
`SceneDelegate`에서 뷰 컨트롤러의 속성에 접근해서 의존성을 주입할 수 있도록 조치했다.   
근데 여전히 싱글톤 패턴에서 벗어나지 못하고 있기 때문에... 나중에라도 의존성을 제대로 주입하는 방법을 고민해서 수정할 계획이다.   

그리고 채점 로직을 구현해서 이제는 셀의 배경색도 바꿀 수 있게 됐다.   
<img width="421" alt="스크린샷 2022-08-24 오후 10 29 58" src="https://user-images.githubusercontent.com/82270058/186431142-40d08d53-79c4-4b53-a5c6-bb6ba3dd4043.png">   
처음엔 이 셀 배경색을 바꿔주려고 `cellForItemAt` 을 붙잡고 `reloadData()`와 `performBatchUpdate()`를 어떻게 해야 할지 씨름했다.   
그러다 밑져야 본전이라는 생각으로 그냥 `indexPath`의 섹션과 로우에 해당하는 셀에 직접 접근해서 배경색을 바꾸었는데.. 너무 쉽게 되어 버렸다..   
```swift
func cellUpdate(indexPath: IndexPath, backgroundColor: UIColor) {
	let cell = gameView?.cellForItem(at: indexPath)
	cell?.backgroundColor = backgroundColor
}

wordManager?.wordCheck(indexPath: indexPath, userInput: userInput, UICollectionView: gameView) {
    (indexPath, backgroundColor, userCharacter, userInput) in
	    self.cellUpdate(indexPath: indexPath, backgroundColor: backgroundColor)
	    if indexPath == [4,4] {
		    // MARK: 게임 종료
    }
}
```

세상에.. 이렇게 쉽게 할 수 있었다니...   
이제는 내부에서 각 `section` 에 해당하는 입력값들을 따로 저장해두고 정답과 비교해야 한다.   
`section` 을 고려하지 않고 유저 인풋을 하나씩 저장했다가는 원하지 않는 상황에 정답이 나올 수 있기 때문.   
열거형의 원시값이나 연관값으로 처리하려고 시도 중이다.   

- 한 일
- [x]  각 글자의 위치와 `indexPath`에 해당하는 셀 컬러 바꾸기

- 해야할 일
- [ ]  이전 `section`의 인풋이 끝나지 않으면 다음 섹션으로 넘어가지 못하도록 하기
- [ ]  각 `section`에 해당하는 입력값을 따로 저장하되, 열거형으로 관리하기
- [ ]  리셋 버튼 만들고 초기 상태로 되돌리기
- [ ]  현재 화면에 보여지고 있는 정답 단어를 숨겨두기

---

- **22.08.25.**

오늘은 드디어 필요한 기능을 구현했다.   
하고 싶었던 열거형도 적용해서 연관값으로 각 줄의 입력값을 정리할 수 있었다.   
원시값이랑 연관값을 같이 못 써서 골치 아팠었는데, 생각해보니 열거형 `init()`을 정의하면 되는 일이었다.   
2차원 배열로 만들어서 `section`의 줄마다 `row`에 해당하는 5개짜리 빈 배열에 값을 넣어주었다.   
이렇게 구현하면, 굳이 다른 섹션의 입력을 금지할 필요가 없다!!   

```swift

// MARK: Enum Init
init(line: Int, userInput: String) {
	switch line {
		case 0:
			self = .firstLine(userInput: userInput)
		case 1:
			self = .secondLine(userInput: userInput)
		case 2:
			self = .thirdLine(userInput: userInput)
		case 3:
			self = .fourthLine(userInput: userInput)
		case 4:
			self = .fifthLine(userInput: userInput)
		default:
			self = .error
			break
	}
}

// MARK: Interactor
let line = InputLines(line: indexPath.section, userInput: userInput)
switch line {
	case .firstLine:
		inputArrays[indexPath.section][indexPath.row] = line.getCellInput(userInput)
		if !inputArrays[indexPath.section].contains("") { chance -= 1 }

		let backgroundColor = answerCheck(userWord: inputArrays[indexPath.section], userInput: userInput, indexPath: indexPath)
		completion(indexPath, backgroundColor)
}
```

필요없는 코드들을 삭제했고 정답 여부에 따른 후처리를 구현했다.   
`NotificationCenter`도 각 상황에 맞게 적용하고 화면 전환에 따라 지우는 로직도 추가했다.   
이제 정말 끝이 보인다.   
조금만 더 힘내서 마무리해보자!   

- 한 일
- [x]  각 `section`에 해당하는 입력값을 따로 저장하되, 열거형으로 관리하기
- [x]  리셋 버튼 만들고 초기 상태로 되돌리기
- [x]  현재 화면에 보여지고 있는 정답 단어를 숨겨두기

- 해야할 일
- [ ]  코드 리팩토링
	- [ ]  필요 없는 코드 정리해서 버리기
	- [ ]  VIPER 아키텍쳐에 맞게 `Router` 제대로 구현하기
	- [ ]  의존성 주입 올바르게 구현하기

---

- **22.08.30.**
멋사 앱스쿨을 준비하면서 과제 수행하느라 이 프로젝트를 볼 여유가 없었다.  
여차저차 잘 마무리해서 과제도 다 제출했고 이제 한숨 돌리고 있다.   

프로젝트가 어느정도 완성되었다고 생각했는데, 자잘한 버그가 꽤 많았다.   
친구한테 프로젝트한 거 자랑하려고 화면녹화를 하다가 버그가 나와서 그거 고쳤다.   
`reset` 버튼을 누르면 `interactor`도 함께 초기화를 해야 하는데 그걸 놓쳤던 것 같다.   
내일까지는 좀 쉬고 싶다...   
쉬다가 다시 열심히 해야겠다.

- 한 일
- [x]  자잘한 버그 픽스

- 해야할 일
- [ ]  코드 리팩토링
	- [ ]  필요 없는 코드 정리해서 버리기
	- [ ]  VIPER 아키텍쳐에 맞게 `Router` 제대로 구현하기
	- [ ]  의존성 주입 올바르게 구현하기
