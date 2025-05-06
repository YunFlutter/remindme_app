import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
      notificationCategories: <DarwinNotificationCategory>[
        DarwinNotificationCategory(
          'routineCategory',
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain(
              'start_routine',
              '루틴 시작하기',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
            DarwinNotificationAction.plain('check_complete', '완료로 체크'),
            DarwinNotificationAction.plain(
              'skip_step',
              '다음으로',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        ),
      ],
    );

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final androidDetails = AndroidNotificationDetails(
  'routine_channel_id', // 채널 ID (필수)
  '루틴 알림', // 채널 이름 (필수)
  channelDescription: '루틴 알림 설명',
  importance: Importance.max, // ✅ null이면 crash
  priority: Priority.high, // ✅ null이면 crash
  playSound: false,
  enableVibration: true,
);

final InitializationSettings settings = InitializationSettings(
  iOS: initializationSettingsDarwin,
  android: initializationSettingsAndroid,
);
