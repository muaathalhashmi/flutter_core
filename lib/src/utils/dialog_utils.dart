import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(
  BuildContext context, {
  String? title,
  String? message,
  String? positiveBtnText,
  String? negativeBtnText,
  bool showPositiveBtn = true,
  bool showNegativeBtn = true,
}) async {
  bool? isYes = await showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(
        message ?? 'Are you sure?',
      ),
      actions: [
        if (showNegativeBtn)
          ElevatedButton(
            // textColor: Theme.of(context).accentColor,
            child: Text(
              negativeBtnText ?? 'No',
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
        if (showPositiveBtn)
          ElevatedButton(
            // textColor: Theme.of(context).accentColor,
            child: Text(
              positiveBtnText ?? 'Yes',
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
      ],
    ),
  );
  return isYes == true;
}

Future<bool> showInfoDialog(
  BuildContext context, {
  String? title,
  @required String? message,
}) {
  return showConfirmationDialog(context,
      title: title,
      message: message,
      showNegativeBtn: false,
      positiveBtnText: 'OK');
}

Future<void> showProgressDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 32),
              Text(
                'Please Wait',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
