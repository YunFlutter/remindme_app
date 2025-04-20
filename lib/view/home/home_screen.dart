import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/service/icon_mapper.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';
import 'package:remindme_app/core/widgets/routine_card/routine_card.dart';
import 'package:remindme_app/core/widgets/routine_card/routine_card_model.dart';
import 'package:remindme_app/view/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '안녕하세요! ${viewModel.state.userName} 님 ',
                          style: AppTextStyles.headingL(),
                        ),
                        Text('오늘도 차근차근 시작해볼까요? 🙌'),
                        SizedBox(
                          height: 20,
                        ),
                        viewModel.state.routineList.isEmpty
                            ? Expanded(
                          child: Center(
                            child: Text(
                              "아직 루틴이 없어요!\n루틴을 추가 해보세요!",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyM(),
                            ),
                          ),
                        )
                            : Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                spacing: 20,
                                children:
                                viewModel.state.routineList
                                    .map(
                                      (items) => RoutineCard(
                                    cardModel: RoutineCardModel(
                                      onTap: (){
                                        print(items);
                                      },
                                      icons: iconData(items.routineIconName),
                                      badgeColor: items.routineColor,
                                      badgeBackGroundColor:
                                      items.routineColor,
                                      routineTitle: items.title,
                                      routineTime: items.time,
                                    ),
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '오늘의 감정',
                                    style: AppTextStyles.headingL(),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: LucideIconWidget(
                                      icon: LucideIcons.squarePen,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBlue,
                                        shape: BoxShape.circle
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: LucideIconWidget(
                                      icon: LucideIcons.smile,
                                      color: AppColors.baseWhite,
                                      size: 18,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("오늘 하루는 어떠셨나요?", style: AppTextStyles.bodyM(),),
                                      Text("오늘의 감정을 기록해보세요", style: AppTextStyles.bodyS(color: AppColors.grayText),)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 2,
                    onPressed: () {
                      context.push("/routine-add");
                    },
                    child: LucideIconWidget(
                      icon: LucideIcons.plus,
                      color: AppColors.baseWhite,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}