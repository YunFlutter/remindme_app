import 'package:hive_ce/hive.dart';
import 'package:remind_me_app/data/data_model/routine/routine_data_model.dart';

class ResetRoutineCompletionUseCase {
  Future<void> execute() async {
    final box = await Hive.openBox<RoutineDataModel>('routineBox');

    for (int i = 0; i < box.length; i++) {
      final routine = box.getAt(i);

      if (routine != null) {
        final lastDate = routine.lastCompletedDate;
        final today = DateTime.now();

        if (lastDate == null || !_isSameDay(lastDate, today)) {
          final updatedRoutine = routine.copyWith(isCompletedToday: false);
          await box.putAt(i, updatedRoutine);
        }
      }
    }
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
