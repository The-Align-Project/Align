import 'package:flutter/cupertino.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback onConfirm;
  final String confirmButtonText;
  final VoidCallback onCancel;

  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.confirmButtonText,
    required this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: content,
      actions: [
        CupertinoDialogAction(
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: onConfirm,
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}