import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    var inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          print('button ${textValue}');
          textController.clear();
        },
        icon: const Icon(Icons.send_outlined),
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value ${value}');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
