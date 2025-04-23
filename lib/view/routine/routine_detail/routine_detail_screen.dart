import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart'; // 아이콘용
import 'package:remindme_app/core/service/hex_to_color.dart';
import 'package:remindme_app/core/service/icon_mapper.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';
import 'package:remindme_app/view/routine/routine_detail/routine_detail_state.dart';

class RoutineDetailScreen extends StatelessWidget {
  final RoutineDetailState state;
  final RoutineModel routineModel;

  const RoutineDetailScreen({
    super.key,
    required this.state,
    required this.routineModel,
  });

  @override
  Widget build(BuildContext context) {
    print(routineModel);
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      appBar: AppBar(
        backgroundColor: AppColors.baseWhite,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          '루틴 상세',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 루틴 아이콘과 제목
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: hexToColor(routineModel.routineColor),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    getLucideIconData(routineModel.routineIconName),
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  routineModel.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 스텝 리스트 제목
            const Text(
              '루틴 스텝',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // 루틴 스텝 리스트
            Expanded(
              child: ListView.builder(
                itemCount: routineModel.steps.length,
                itemBuilder: (context, index) {
                  final step = routineModel.steps[index];
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      title: Text(step['title']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {

                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}