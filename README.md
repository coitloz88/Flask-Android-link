# Flask-Android-link
Flask로 구축한 서버에서 발생한 난수를 Android 스튜디오에서 가져온다.  

## 220413  
1. 현재, Flask에서 구축한 로컬 호스트 IP (127.X... 혹은 192.X...)로 접속하는 경우 접속되지 않음
2. 대신 [typicode](https://jsonplaceholder.typicode.com/todos/1)에서 가져온 .json 파일을 통째로 화면에 출력 가능함
3. 실제 웹 서버 구축 방법([AWS](https://velog.io/@jaehyeong/Flask-%EC%9B%B9-%EC%84%9C%EB%B2%84-AWS-EC2%EC%97%90-%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0)? typicode?)을 알아볼 것
4. .json 파일을 Android에서 받아 파싱하는 방법을 알아볼 것


## 220414
1. [Android Emulator](https://developer.android.com/studio/run/emulator-networking?hl=ko)의 경우, `127.0.0.1`은 에뮬레이션된 기기의 루프백 인터페이스를 의미함.  
  따라서, 호스트 루프백 인터페이스의 특수 별칭 `10.0.2.2 (개발 머신의 127.0.0.1)`을 사용해야 함.
2. [당겨서](https://developer.android.com/training/swipe/add-swipe-interface?hl=ko) [새로고침](https://stickode.tistory.com/20)
    - 앱을 종료 후 재실행하지 않고, 당겨서 새로고침하여 랜덤한 수가 매번 바뀌는 것을 확인할 수 있음
    - ConstraintLayout → SwipeRefreshLayout
    - 매번 랜덤한 숫자를 받아오는 것을 새로 확인할 수 있음