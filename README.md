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

- 22.08.11.   
콜렉션뷰와 콜렉션뷰셀을 뷰컨에 넣고 화면에 띄울 수 있었다.   
그런데 `UICollectionView(frame:)`으로 생성하는 바람에 콜렉션뷰 자체의 크기 조정이 어렵다.   
레이웬더리치에서 UICollectionView Tutorial을 찾았으니 활용해서 공부해보자.

- 이어서 해야할 일
- [x]  콜렉션뷰셀 정렬하기 - 22.08.12.
- [ ]  콜렉션뷰 `frame` 조정하기

---

- 22.08.12.   
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

- 22.08.13.   
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

