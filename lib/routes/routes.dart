abstract class Routes {

  //스플래시 페이지
  static const String splash = '/';

  //온보딩 페이지
  static const String onboarding = '/onboarding';

  //로그인, 회원가입 페이지
  static const String login = '/login';
  static const String signUp = '/sign-up';

  // 홈페이지
  static const String home = '/home';


  //루틴 관련 페이지
  static const String routine = '/routine'; //루틴 목록 페이지
  static const String routineDetail = '/routine-detail';
  static const String routineEdit = '/routine-edit';
  static const String routineAdd = '/routine-add';
  static const String routineActive = '/routine-active';

  //감정 일기 관련 페이지
  static const String emotion = '/emotion'; //감정 달력 페이지
  static const String emotionAdd = '/emotion-add';

  //세팅 관련 페이지
  static const String setting = '/setting';
  static const String settingAlert = '/setting-alert';
  static const String settingNicName = '/setting-nickname';
}
