import 'package:flutter/material.dart';
import 'small_button.dart';

class BottomPane extends StatelessWidget {
  const BottomPane({
    Key? key,
    required this.string,
    required this.value,
    required this.minus,
    required this.plus,
  }) : super(key: key);

  final String string;
  final String value;
  final VoidCallback minus;
  final VoidCallback plus;

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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(string),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red,
                        onTap: minus,
                      ),
                      SmallButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red,
                        onTap: plus,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
