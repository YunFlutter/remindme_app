# 📘 RoutineAddState 코드 해석

## 📘 RoutineAddState 코드 해석

`RoutineAddState`는 루틴 추가 화면에서 사용되는 모든 UI 상태 및 사용자 선택 옵션을 불변 객체로 정의합니다.

### 주요 필드:

- `title`, `time`, `routineIconName`: 루틴 정보
- `steps`: 사용자가 설정한 루틴 단계
- `soundFilePath`: 선택된 알림 사운드
- `badgeColor`, `routineColor`: 색상 테마
- `routineIconNames`, `badgeColors`: UI에서 선택 가능한 값들
- `isSubmitting`, `isSuccess`: 저장 상태 표시

UI 입력 요소에 직접 연결되는 `TextEditingController`와 `FocusNode`도 포함되어 있습니다.