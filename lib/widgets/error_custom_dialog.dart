import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showErrorDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? redirectPath, // optional redirect route
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Error",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: ErrorDialogContent(title: title, message: message),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: child,
      );
    },
  );

  Future.delayed(const Duration(seconds: 2), () {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    // ✅ Automatically navigate after dialog closes
    if (redirectPath != null && context.mounted) {
      context.go(redirectPath);
    }
  });
}

class ErrorDialogContent extends StatelessWidget {
  final String title;
  final String message;

  const ErrorDialogContent({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AnimatedErrorIcon(),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class AnimatedErrorIcon extends StatefulWidget {
  const AnimatedErrorIcon({super.key});

  @override
  State<AnimatedErrorIcon> createState() => _AnimatedErrorIconState();
}

class _AnimatedErrorIconState extends State<AnimatedErrorIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.red,
        child: Icon(Icons.close, color: Colors.white, size: 30),
      ),
    );
  }
}
