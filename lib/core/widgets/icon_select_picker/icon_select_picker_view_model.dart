import 'package:flutter/cupertino.dart';
import 'package:remind_me_app/core/constants/lucide_icon_data_with_keywords.dart';
import 'package:remind_me_app/core/widgets/icon_select_picker/icon_select_picker_state.dart';

class IconSelectPickerViewModel with ChangeNotifier {
  IconSelectPickerState _state = IconSelectPickerState();

  IconSelectPickerState get state => _state;

  void searchIconKeyWord({required String keyword}) {
    _state = _state.copyWith(
      searchIconKeyWord: keyword,
      filterIconList:
          lucideIconData
              .where((items) => items["keywords"].contains(keyword))
              .toList(),
    );
    notifyListeners();
  }
}
