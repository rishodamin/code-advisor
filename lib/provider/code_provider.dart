import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

class CodeProvider extends ChangeNotifier {
  bool isStart = false;
  bool isReview = false;

  CodeController codeController = CodeController();

  void updateStartStatus(bool status) {
    isStart = status;
    notifyListeners();
  }

  void updateReviewStatus(bool status) {
    isReview = status;
    notifyListeners();
  }
}
