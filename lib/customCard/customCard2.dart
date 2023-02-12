import 'package:flutter/material.dart';
import 'package:mobile_app/constrants/colors.dart';

class CustomCard2 extends StatefulWidget {
  final bool hasDeleteIcon;

  final void Function()? onDeletePressed;
  final List<Widget> myChildren;
  const CustomCard2(
      {Key? key,
      required this.myChildren,
      this.hasDeleteIcon = true,
      this.onDeletePressed})
      : super(key: key);

  @override
  _CustomCard2State createState() => _CustomCard2State();
}

class _CustomCard2State extends State<CustomCard2> {
  @override
  Widget build(BuildContext context) {
    // bool changedValue= false ;
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  ...widget.myChildren,
                  widget.hasDeleteIcon
                      ? IconButton(
                          onPressed: (() {
                           
                            widget.onDeletePressed!();
                          }),
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
