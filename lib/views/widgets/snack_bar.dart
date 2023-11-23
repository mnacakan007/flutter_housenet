import 'package:flutter/material.dart';

void showFlashError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SizedBox(
        height: 30, // Adjust the height as needed
        child: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}