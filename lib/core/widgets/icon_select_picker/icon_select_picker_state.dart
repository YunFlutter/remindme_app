import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
part 'icon_select_picker_state.freezed.dart';

@freezed

class IconSelectPickerState with _$IconSelectPickerState {
  final List<Map<String,dynamic>> filterIconList;
  final String selectIconName;
  final String selectIconData;
  final String searchIconKeyWord;

  const IconSelectPickerState({
     this.filterIconList = const[],
     this.selectIconName = '',
     this.selectIconData = '',
     this.searchIconKeyWord = '',
  });
}
