# 📘 RoutineActionViewModel 코드 해석

## 📘 RoutineActionViewModel 코드 해석

`RoutineActionViewModel`은 루틴 실행 중 타이머, 사운드, 햅틱 피드백 등을 제어하고 상태를 추적하는 로직을 담당합니다.

### 주요 기능:

- 타이머 컨트롤 (시작/일시정지/재개)
- 사운드 재생 (`just_audio`)
- 현재 스텝 추적 및 다음 스텝 이동
- 외부 이벤트(`RoutineActionEvent`)에 따라 상태 변화

이벤트 기반으로 액션을 정의하고 그에 따라 상태를 처리하는 구조를 가집니다.