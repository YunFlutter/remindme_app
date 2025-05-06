import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me_app/core/hive/hive_box.dart';
import 'package:remind_me_app/core/result/result.dart';
import 'package:remind_me_app/core/service/di_setup.dart';
import 'package:remind_me_app/data/repository_impl/routine/routine_repository_impl.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/domain/repository/routine/routine_repository.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

import 'initialize_constants.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {}

Future<void> setupTimezone() async {
  tz_data.initializeTimeZones();

  final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

Future<void> initializeNotification() async {
  if (Platform.isAndroid) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  await flutterLocalNotificationsPlugin.initialize(
    settings,
    onDidReceiveNotificationResponse: (response) async {
      print(response.payload);
      final RoutineRepository test = RoutineRepositoryImpl(
        box: HiveBox().routineBox,
      );
      final Result<RoutineModel, String> result = await test.getRoutineById(
        response.payload.toString(),
      );
      switch (result) {
        case Success<RoutineModel, String>():
          if (navigatorKey.currentContext!.canPop()) {
            GoRouter.of(
              navigatorKey.currentContext!,
            ).push('/routine-detail', extra: result.data);
          } else {
            GoRouter.of(navigatorKey.currentContext!).go('/home');
            GoRouter.of(
              navigatorKey.currentContext!,
            ).push('/routine-detail', extra: result.data);
          }

        case Error<RoutineModel, String>():
          print("Error ${result.error}");
      }
    },
  );
}

Future<void> printAllScheduledNotifications() async {
  final List<PendingNotificationRequest> pendingNotifications =
      await flutterLocalNotificationsPlugin.pendingNotificationRequests();

  if (pendingNotifications.isEmpty) {
    print('⛔️ 예약된 알림이 없습니다.');
    return;
  }

  print('📋 예약된 알림 목록 (${pendingNotifications.length}개):');
  for (var notification in pendingNotifications) {
    print('---');
    print('ID: ${notification.id}');
    print('Title: ${notification.title}');
    print('Body: ${notification.body}');
    print('Payload: ${notification.payload}');
  }
}

Future<void> scheduleRoutineNotification({
  required int notificationId,
  required String title,
  required String body,
  required int hour,
  required int minute,
  required String routineId,
}) async {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduled = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );

  if (scheduled.isBefore(now)) {
    scheduled = scheduled.add(const Duration(days: 1));
  }

  await flutterLocalNotificationsPlugin.zonedSchedule(
    notificationId,
    title,
    body,
    scheduled,
    NotificationDetails(
      iOS: DarwinNotificationDetails(categoryIdentifier: 'routineCategory'),
      android: androidDetails,
    ),
    payload: routineId,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents: DateTimeComponents.time, // 매일 같은 시간 반복
  );
}
