# 📘 RoutineAddViewModel 코드 해석

## 📘 RoutineAddViewModel 코드 해석

`RoutineAddViewModel`은 루틴 생성 화면에서 사용자의 입력을 받아 상태를 갱신하고, 최종적으로 저장 요청을 수행하는 역할을 합니다.

### 주요 기능 요약:

- `updateTitle`, `updateTime`: 사용자 입력 반영
- `toggleAlarmSetting`, `toggleAnimationVisible`: 설정 관련 상태 제어
- `addStep`, `removeStep`: 루틴 스텝 목록 관리
- `updateSoundPath`: 사운드 미리 듣기 및 설정
- `saveRoutine`: 루틴 저장 및 유효성 검사

코드는 상태 변경 후 항상 `notifyListeners()`를 호출하여 UI를 갱신합니다.