# 📘 RoutineActionState / Event 코드 해석

## 📘 RoutineActionState / RoutineActionEvent 코드 해석

### ✅ RoutineActionState

```dart
const factory RoutineActionState({
  @Default(false) bool isStarted,
  @Default(false) bool isPaused,
  @Default(0) int currentStepIndex,
})
```

- 루틴이 시작되었는지, 일시정지 상태인지 여부를 포함합니다.
- `currentStepIndex`는 현재 실행 중인 스텝을 나타냅니다.

### ✅ RoutineActionEvent

```dart
sealed class RoutineActionEvent {
  const factory startRoutine()
  const factory pauseRoutine()
  const factory resumeRoutine()
  const factory nextStep()
  ...
}
```

- 사용자 인터랙션 또는 시스템 트리거를 선언적으로 표현한 sealed class입니다.