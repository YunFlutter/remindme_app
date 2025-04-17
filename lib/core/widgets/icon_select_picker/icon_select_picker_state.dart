import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
part 'icon_select_picker_state.freezed.dart';

@freezed

class IconSelectPickerState with _$IconSelectPickerState {
  @override
  final List<Map<String,dynamic>> filterIconList;
  @override
  final String selectIconName;
  @override
  final String selectIconData;
  @override
  final String searchIconKeyWord;

  const IconSelectPickerState({
     this.filterIconList = const[],
     this.selectIconName = '',
     this.selectIconData = '',
     this.searchIconKeyWord = '',
  });
}
