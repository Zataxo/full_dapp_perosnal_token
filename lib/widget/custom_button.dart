import 'package:flutter/material.dart';
import 'package:personal_token_tracker/utils/enums.dart';
import 'package:personal_token_tracker/utils/util_logic.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.buttonName,
    this.icon,
    this.onPressed,
    this.textStyle,
    this.state,
  }) : super(key: key);

  final Widget? icon;
  final String buttonName;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final LoadingState? state;
  // late bool? isPressed = false;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Color(0xffB971A3),
                Color(0xffA03E82),
                Color(0xffFFFFFF),
              ])),
          child: Consumer<UtilLogic>(builder: (context, utilLogic, child) {
            if (utilLogic.state == LoadingState.loading) {
              return const CircularProgressIndicator(
                color: Color(0xff55389B),
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.buttonName,
                    style: widget.textStyle ??
                        const TextStyle(color: Color(0XffFFFFFF)),
                  ),
                  widget.icon ?? const SizedBox()
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
