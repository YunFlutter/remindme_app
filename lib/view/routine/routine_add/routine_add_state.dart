import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_step_model.dart';

part 'routine_add_state.freezed.dart';

@freezed
class RoutineAddState with _$RoutineAddState {
  final String title;
  final String time;
  final String routineIconName;
  final String badgeColor;
  final String routineColor;
  final bool isSubmitting;
  final List<RoutineStepModel> steps;
  final bool isSuccess;
  final bool isAnimatedVisible;
  final List<String> badgeColors;
  final List<String> routineBackgroundColors;
  final List<String> routineIconNames;
  TextEditingController titleTextEditingController = TextEditingController();
  FocusNode titleFocusNode = FocusNode();

  RoutineAddState({
    this.title = '',
    this.time = '',
    this.routineIconName = 'setting',
    this.badgeColor = '#91B8F7',
    this.routineColor = '#A0C4FF',
    this.isAnimatedVisible = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.steps = const <RoutineStepModel>[],
    this.routineIconNames = const [
      'sun', // 기상, 아침 루틴
      'coffee', // 여유 시간, 휴식 루틴
      'alarm', // 시간 알림, 특정 루틴 시간
      'book', // 공부, 독서 루틴
      'check-circle', // 완료 체크, 습관 추적
      'brush', // 세면, 씻기 루틴
      'dumbbell', // 운동, 스트레칭 루틴
      'moon', // 저녁 루틴, 수면 준비
      'utensils', // 식사 루틴
      'notebook', // 일기, 감정 기록 루틴
    ],
    this.badgeColors = const [
      '#AAF0D1', // 하늘민트
      '#FFC1CC', // 복숭아핑크
      '#FFF3B0', // 크림옐로우
      '#B0E0E6', // 파우더블루
      '#E6E6FA', // 라벤더퍼플
      '#FFA07A', // 살몬코랄
      '#FBE8A6', // 바닐라크림
      '#ADD8E6', // 연차콜리블루
      '#FFDAB9', // 소프트오렌지
      '#E0FFF6', // 라이트민트
    ],
    this.routineBackgroundColors = const [
      '#FFFCF2', // 아이보리화이트
      '#E0F7FA', // 페일블루
      '#FFF0F5', // 페일핑크
      '#F5F5DC', // 코튼베이지
      '#F2F2F2', // 머슬린그레이
      '#EAF6FF', // 크림스카이
      '#F1FFF7', // 파스텔민트
      '#F7F5FB', // 라일락그레이
      '#FFFEF2', // 코코넛화이트
      '#FDF6ED', // 소프트샌드
    ],
  });
}
