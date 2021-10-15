import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton(
      {Key? key, required this.icon, required this.string, required this.onTap})
      : super(key: key);

  final Icon icon;
  final String string;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: ColoredBox(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextButton(
                onPressed: onTap,
                autofocus: false,
                clipBehavior: Clip.none,
                focusNode: FocusNode(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    Text(string),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
