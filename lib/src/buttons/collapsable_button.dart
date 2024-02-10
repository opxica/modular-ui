import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

class MUICollapsableButton extends StatefulWidget {
  const MUICollapsableButton({
    super.key,
    required this.collapsibleHeight,
    required this.collapsibleWidth,
    required this.collapsibleChild,
  });

  final double collapsibleHeight;
  final double collapsibleWidth;
  final Widget collapsibleChild;

  @override
  // ignore: library_private_types_in_public_api
  _MUICollapsableButtonState createState() => _MUICollapsableButtonState();
}

class _MUICollapsableButtonState extends State<MUICollapsableButton> {
  bool _isCollapsableButtonSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MUIPrimaryButton(
          text: "Collapsable",
          onPressed: () {
            setState(
              () {
                _isCollapsableButtonSelected = !_isCollapsableButtonSelected;
              },
            );
          },
        ),
        _isCollapsableButtonSelected
            ? Container(
                height: widget.collapsibleHeight,
                width: widget.collapsibleWidth,
                color: Colors.green,
                child: widget.collapsibleChild,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
