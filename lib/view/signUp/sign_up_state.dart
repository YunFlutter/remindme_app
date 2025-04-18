
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final bool pageOpacity;
  final bool isTitleVisible;
  final bool isFieldVisible;

  SignUpState({
    required this.textEditingController,
    required this.focusNode,
    this.pageOpacity = false,
    this.isFieldVisible = false,
    this.isTitleVisible = false
  });

}