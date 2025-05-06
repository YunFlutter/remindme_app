import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_step_model.dart';

part 'routine_add_state.freezed.dart';

@freezed
class RoutineAddState with _$RoutineAddState {
  @override
  final String title;
  @override
  final String time;
  @override
  final String routineIconName;
  @override
  final String badgeColor;
  @override
  final String routineColor;
  @override
  final bool isSubmitting;
  @override
  final bool isAlarmSetting;
  @override
  final List<Map<String, dynamic>> steps;
  @override
  final bool isSuccess;
  @override
  final bool isAnimatedVisible;
  @override
  final List<String> badgeColors;
  @override
  final List<String> routineBackgroundColors;
  @override
  final List<String> routineIconNames;
  @override
  TextEditingController titleTextEditingController = TextEditingController();
  @override
  FocusNode titleFocusNode = FocusNode();
  @override
  final List<Map<String,dynamic>> soundFiles;
  @override
  final String soundFilePath;

  RoutineAddState({
    this.title = '',
    this.time = '',
    this.soundFilePath = '',
    this.routineIconName = 'setting',
    this.badgeColor = '#91B8F7',
    this.routineColor = '#A0C4FF',
    this.isAnimatedVisible = true,
    this.isAlarmSetting = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.steps = const [],
    this.soundFiles = const [
      {'path': 'assets/alarm_sound/1-Arpeggio.m4a', 'title': 'Arpeggio'},
      {'path': 'assets/alarm_sound/2-Breaking.m4a', 'title': 'Breaking'},
      {'path': 'assets/alarm_sound/3-Canopy.m4a', 'title': 'Canopy'},
      {'path': 'assets/alarm_sound/4-Chalet.m4a', 'title': 'Chalet'},
      {'path': 'assets/alarm_sound/5-Chirp.m4a', 'title': 'Chirp'},
      {'path': 'assets/alarm_sound/6-Daybreak.m4a', 'title': 'Daybreak'},
      {'path': 'assets/alarm_sound/7-Departure.m4a', 'title': 'Departure'},
      {'path': 'assets/alarm_sound/8-Dollop.m4a', 'title': 'Dollop'},
      {'path': 'assets/alarm_sound/9-Journey.m4a', 'title': 'Journey'},
      {'path': 'assets/alarm_sound/10-Kettle.m4a', 'title': 'Kettle'},
      {'path': 'assets/alarm_sound/11-Mercury.m4a', 'title': 'Mercury'},
      {'path': 'assets/alarm_sound/12-Milky Way.m4a', 'title': 'Milky Way'},
      {'path': 'assets/alarm_sound/13-Quad.m4a', 'title': 'Quad'},
      {'path': 'assets/alarm_sound/14-Radial.m4a', 'title': 'Radial'},
      {'path': 'assets/alarm_sound/15-Reflection.m4a', 'title': 'Reflection'},
      {'path': 'assets/alarm_sound/16-Scavenger.m4a', 'title': 'Scavenger'},
      {'path': 'assets/alarm_sound/17-Seedling.m4a', 'title': 'Seedling'},
      {'path': 'assets/alarm_sound/18-Shelter.m4a', 'title': 'Shelter'},
      {'path': 'assets/alarm_sound/19-Sprinkles.m4a', 'title': 'Sprinkles'},
      {'path': 'assets/alarm_sound/20-Steps.m4a', 'title': 'Steps'},
      {'path': 'assets/alarm_sound/21-Storytime.m4a', 'title': 'Storytime'},
      {'path': 'assets/alarm_sound/22-Tease.m4a', 'title': 'Tease'},
      {'path': 'assets/alarm_sound/23-Tilt.m4a', 'title': 'Tilt'},
      {'path': 'assets/alarm_sound/24-Unfold.m4a', 'title': 'Unfold'},
      {'path': 'assets/alarm_sound/25-Valley.m4a', 'title': 'Valley'},
    ],
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
