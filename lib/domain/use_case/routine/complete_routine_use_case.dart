import 'package:hive_ce/hive.dart';
import 'package:remind_me_app/data/data_model/routine/routine_data_model.dart';

// (필요하면) box 이름 상수화 가능
const String kRoutineBoxName = 'routineBox';

class CompleteRoutineUseCase {
  Future<void> execute({required String routineId}) async {
    final box = await Hive.openBox<RoutineDataModel>(kRoutineBoxName);

    final routineIndex = box.values.toList().indexWhere((element) => element.id == routineId);

    if (routineIndex != -1) {
      final routine = box.getAt(routineIndex);

      if (routine != null) {
        final updatedRoutine = routine.copyWith(
          isCompletedToday: true,
          lastCompletedDate: DateTime.now(),
        );

        await box.putAt(routineIndex, updatedRoutine);
      }
    }
  }
}