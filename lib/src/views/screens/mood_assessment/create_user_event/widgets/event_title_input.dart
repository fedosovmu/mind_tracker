import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_input_decoration.dart';


class EventTitleInput extends StatelessWidget {
  final TextEditingController controller;

  EventTitleInput({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: CustomInputDecoration(
          hintText: 'Введите название события'
      ),
    );
  }
}