import 'package:flutter/material.dart';
import 'package:mobile_app/constrants/colors.dart';

class CustomCard3 extends StatefulWidget {
  final Widget myChild;
  final bool hasDeleteIcon;

  const CustomCard3(
      {super.key, required this.myChild, this.hasDeleteIcon = true});

  @override
  _CustomCard3State createState() => _CustomCard3State();
}

class _CustomCard3State extends State<CustomCard3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            constraints: const BoxConstraints(minHeight: 50),
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.myChild,
                  widget.hasDeleteIcon
                      ? IconButton(
                          onPressed: (() {}),
                          icon: const Icon(
                            Icons.delete,
                            color: tdRed,
                          ))
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
