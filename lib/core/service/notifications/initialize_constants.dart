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
AndroidInitializationSettings('app_icon'); // 확장자 없이 이름만!

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final InitializationSettings settings = InitializationSettings(
  iOS: initializationSettingsDarwin,
  android: initializationSettingsAndroid
);
