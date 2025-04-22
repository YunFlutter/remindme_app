
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  @override
  final TextEditingController textEditingController;
  @override
  final FocusNode focusNode;
  @override
  final bool pageOpacity;
  @override
  final bool isTitleVisible;
  @override
  final bool isFieldVisible;

  SignUpState({
    required this.textEditingController,
    required this.focusNode,
    this.pageOpacity = false,
    this.isFieldVisible = false,
    this.isTitleVisible = false
  });

}