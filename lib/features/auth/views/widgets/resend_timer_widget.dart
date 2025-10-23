import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';
import '../../../../core/utils/colors/app_colors.dart';

class ResendTimerWidget extends StatefulWidget {
  final VoidCallback onResend;

  const ResendTimerWidget({super.key, required this.onResend});

  @override
  State<ResendTimerWidget> createState() => _ResendTimerWidgetState();
}

class _ResendTimerWidgetState extends State<ResendTimerWidget> {
  Timer? _timer;
  int _remainingSeconds = 25;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _remainingSeconds = 25;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _handleResend() {
    if (_canResend) {
      widget.onResend();
      _startTimer();
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: AppColors.kOutlinedGrayColor, fontSize: 14),
        children: [
          TextSpan(
            text: "Didn't receive code? ",
            style: getRegularStyle(
              fontSize: FontSize.s14,
              color: AppColors.kOutlinedGrayColor,
              fontFamily: FontConstants.interFontfamily,
            ),
          ),
          TextSpan(
            text: 'Resend',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: _canResend ? AppColors.kPrimaryColor : AppColors.kBlackColor,
              color: _canResend ? AppColors.kPrimaryColor : AppColors.kBlackColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.interFontfamily,
            ),
            recognizer: _canResend
                ? (TapGestureRecognizer()..onTap = _handleResend)
                : null,
          ),
          TextSpan(
            text: ' in ${_formatTime(_remainingSeconds)}',
            style:getRegularStyle(
              fontSize: FontSize.s14,
              color: AppColors.kOutlinedGrayColor,
              fontFamily: FontConstants.interFontfamily,
            ),
          ),
        ],
      ),
    );
  }
}
