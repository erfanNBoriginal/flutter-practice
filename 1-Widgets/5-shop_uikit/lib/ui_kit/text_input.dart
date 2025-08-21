import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class TextInput extends StatefulWidget {
  //
  final String title;

  final String hint;

  final bool isRequired;

  final bool disabled;

  final bool readOnly;

  final bool autoFocus;

  final void Function()? onEditingComplete;

  final TextEditingController controller;

  const TextInput({
    super.key,
    this.hint = '',
    this.isRequired = false,
    this.disabled = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.onEditingComplete,
    required this.title,
    required this.controller,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  //
  bool isFocused = false;

  final focusNode = FocusNode();

  @override
  void initState() {
    if (widget.autoFocus) {
      focusNode.requestFocus();
    }
    focusNode.addListener(() {
      isFocused = focusNode.hasFocus;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Opacity(
        opacity: widget.disabled ? 0.6 : 1.0,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: U.Theme.surface,
            borderRadius: BorderRadius.circular(U.Theme.r15),
            border: Border.all(
              width: 1,
              color: isFocused ? U.Theme.primary : Colors.transparent,
            ),
          ),
          padding: const EdgeInsets.only(
            right: 16,
            left: 0,
            top: 14,
            bottom: 14,
          ),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  U.Text(
                    '${widget.title}:',
                    size: U.TextSize.s14,
                    weight: U.TextWeight.medium,
                  ),
                  if (widget.isRequired)
                    Positioned(
                      top: -5,
                      left: -8,
                      child: U.Image.icon(
                        size: 8,
                        path: U.Icons.required,
                      ),
                    )
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  canRequestFocus: !widget.readOnly && !widget.disabled,
                  controller: widget.controller,
                  onEditingComplete: widget.onEditingComplete,
                  enabled: !widget.readOnly && !widget.disabled,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'IranSans',
                    color: U.Theme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: U.Theme.secondary,
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'IranSans',
                      color: U.Theme.outline2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
