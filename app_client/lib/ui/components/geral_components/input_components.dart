import 'package:flutter/material.dart';

Widget geralTextInput({
  required BuildContext context,
  required String text,
  required TextEditingController textController,
  TextInputType type = TextInputType.text,
}) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: text,
          ),
          controller: textController,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget geralDropInput(
  BuildContext context,
  List<String> list,
  String itemSelected,
  Function setStateFunct,
) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[700]!),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          value: itemSelected,
          items: list
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (item) => setStateFunct(item),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget passwordTextInput(
  BuildContext context,
  TextEditingController textController,
) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Password',
          ),
          controller: textController,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget passwordConfirmTextInput(
  BuildContext context,
  TextEditingController textController,
) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Confirm Password',
          ),
          controller: textController,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
