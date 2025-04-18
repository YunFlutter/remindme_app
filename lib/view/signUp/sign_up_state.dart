
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  TextEditingController textEditingController;
  FocusNode focusNode;

  SignUpState({
    required this.textEditingController,
    required this.focusNode,
  });
}