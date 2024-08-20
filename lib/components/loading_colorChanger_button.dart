import 'package:flutter/material.dart';

class SwipeButton extends StatefulWidget {
  const SwipeButton({
    super.key,
    this.onTap,
    this.color = Colors.blue,
    this.successColor = Colors.green,
    this.loadingColor = Colors.grey,
    this.buttonText = "Tap to Confirm",
  });

  final VoidCallback? onTap;
  final Color color; // Color when not loading or in success
  final Color successColor; // Color when in success state
  final Color loadingColor; // Color when loading
  final String buttonText; // Text displayed on the button

  @override
  _SwipeButtonState createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  bool isLoading = false;
  bool isSuccess = false;

  void _onTap() async {
    setState(() {
      isLoading = true;
    });

    // Simulate a network request or any async task
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
      isSuccess = true;
    });

    // Call the tap callback after the success state
    if (widget.onTap != null) {
      widget.onTap!();
    }

    // Simulate reverting back to the original state after a success
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 60,
          width: isLoading ? 100 : 150,
          decoration: BoxDecoration(
            color: isLoading
                ? widget.loadingColor
                : isSuccess
                ? widget.successColor
                : widget.color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: isLoading
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          )
              : isSuccess
              ? const Icon(Icons.check, color: Colors.white, size: 30)
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.touch_app, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                widget.buttonText,
                style: const TextStyle(
                    color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
