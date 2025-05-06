
# 🧠 루틴 추가 기능 전체 구조 및 흐름 (Hive 기반 저장)

Flutter 앱에서 루틴을 추가하는 전체 흐름을 정리한 문서입니다. `RoutineAddScreen`을 시작으로, 상태 관리, 저장 로직, 모델 정의까지 포함하며 Hive 기반 저장소 구조로 설명을 작성했습니다.

---

## 📊 루틴 추가 흐름 다이어그램

```mermaid
flowchart TD
    A[사용자] --> B[루틴 추가 화면 진입]
    B --> C[루틴 제목 입력]
    B --> D[아이콘 선택]
    B --> E[색상 선택]
    B --> F[요일 선택]
    B --> G[루틴 단계 추가 (BottomSheet)]
    G --> H[루틴 단계 입력]
    H --> I[뷰모델에 단계 추가]
    B --> J[저장 버튼 클릭]
    J --> K[saveRoutine 호출]
    K --> L[Hive에 루틴 저장]
```

---

## 📱 1. RoutineAddScreen

루틴 입력 UI 화면입니다.

```dart
// 루틴 추가 화면은 사용자 입력을 받아 ViewModel을 통해 처리합니다.
// ViewModel은 외부에서 주입받으며, Provider를 사용하지 않는 구조입니다.
class RoutineAddScreen extends StatefulWidget {
  final RoutineAddViewModel viewModel;
  ...
}
```
- 외부에서 주입된 ViewModel을 사용하여 상태를 관리합니다.

```dart
class _RoutineAddScreenState extends State<RoutineAddScreen> {
  @override
  void dispose() {
    super.dispose();
    widget.viewModel.audioStop(); // 오디오 녹음 정지
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( // 뒤로가기 제어
      onWillPop: () async {
        context.go('/home');
        return false;
      },
      child: ListenableBuilder(
        listenable: widget.viewModel, // ViewModel 변경 감지
        builder: (context, _) {
          return Scaffold(
            ...
            actions: [
              IconButton(
                onPressed: () => widget.viewModel.saveRoutine(context: context), // 저장 버튼
                icon: LucideIconWidget(
                  icon: LucideIcons.save,
                  color: widget.viewModel.state.steps.isNotEmpty
                      ? AppColors.primaryBlue
                      : AppColors.grayDisabled,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
```

---

## ⚙️ 2. RoutineAddViewModel

사용자 입력을 처리하고 상태를 관리하는 클래스입니다.

```dart
// ViewModel은 ChangeNotifier를 사용하여 상태를 관리하고
// UI와의 연결을 위해 notifyListeners()를 호출합니다.
class RoutineAddViewModel with ChangeNotifier {
  final RoutineRepository _routineRepository; // Hive 기반 저장소
  final AudioPlayer _audioPlayer = AudioPlayer(); // just_audio

  RoutineAddState _state = RoutineAddState();
  RoutineAddState get state => _state;

  void updateTitle(String value) {
    _state = _state.copyWith(title: value); // 상태 갱신
    notifyListeners(); // UI 갱신
  }
```

### 📥 루틴 저장 함수

```dart
// 사용자가 루틴 정보를 모두 입력했을 때 호출되는 저장 함수입니다.
// 입력값 검증 → RoutineModel 생성 → Repository에 저장 → 성공/실패 처리 흐름으로 구성됩니다.
Future<void> saveRoutine({required BuildContext context}) async {
  if (...) {
    Fluttertoast.showToast(msg: "모든 항목을 입력해주세요.");
    return;
  }

  final routine = RoutineModel(
    id: DateTime.now().millisecondsSinceEpoch, // Hive 키로 사용
    ...
  );

  final result = await _routineRepository.addRoutine(routine);
  await _audioPlayer.stop(); // 오디오 정리

  switch (result) {
    case Success():
      context.pop(); // 저장 성공 시 화면 닫기
    case Error(:final error):
      Fluttertoast.showToast(msg: error); // 실패 시 메시지
  }
}
```

---

## 🧠 3. RoutineAddState (freezed)

불변 상태 클래스로, UI에서 필요한 모든 필드를 정의합니다.

```dart
// Freezed 패키지를 사용한 상태 클래스입니다.
// 모든 필드는 불변이며 copyWith를 통해 갱신합니다.
@freezed
class RoutineAddState with _$RoutineAddState {
  const factory RoutineAddState({
    @Default('') String title, // 루틴 제목
    @Default('') String time, // 실행 시간
    @Default([]) List<RoutineStepModel> steps, // 루틴 단계 목록
    @Default('') String badgeColor,
    @Default('') String routineColor,
    @Default('') String routineIconName,
    String? soundFilePath,
    @Default(false) bool isAlarmSetting,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
  }) = _RoutineAddState;
}
```

---

## 📦 4. RoutineModel 정의

Hive에서 사용할 수 있도록 `@HiveType`, `@HiveField` 어노테이션을 붙인 모델입니다.

```dart
// Hive 데이터베이스에 저장될 모델입니다.
// 각 필드에 @HiveField 어노테이션이 필요하며 typeId는 고유 식별자입니다.
@HiveType(typeId: 0)
class RoutineModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final List<RoutineStepModel> steps;
  ...
}
```

- `List<RoutineStepModel>`은 Hive에서 별도로 어댑터 등록이 필요합니다.

---

## 💾 5. Hive 기반 RoutineRepository 구현

```dart
// Hive 박스를 주입받아 루틴을 저장하는 저장소 클래스입니다.
// Result 객체를 반환하여 ViewModel이 성공/실패 여부를 판단할 수 있도록 합니다.
class RoutineRepository {
  final Box<RoutineModel> routineBox;

  RoutineRepository(this.routineBox);

  Future<Result<void>> addRoutine(RoutineModel routine) async {
    try {
      await routineBox.put(routine.id, routine); // Hive 저장
      return Result.success();
    } catch (e) {
      return Result.error('루틴 저장 중 오류: \$e');
    }
  }
}
```

- Hive Box를 통해 루틴을 key-value 형태로 저장합니다.
- 오류가 발생하면 `Result.error`로 감싸서 ViewModel로 전달합니다.

---

## ✅ 전체 흐름 요약

| 단계 | 내용 |
|------|------|
| UI | RoutineAddScreen에서 사용자 입력 |
| 상태 관리 | RoutineAddViewModel, RoutineAddState |
| 저장 모델 | RoutineModel (Hive 지원) |
| 저장 처리 | RoutineRepository에서 Hive에 저장 |


