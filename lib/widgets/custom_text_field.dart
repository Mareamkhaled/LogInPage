import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hint, required this.name,this.onchanged});
  String? hint;
  String? name;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name!),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 5,
        ),
        TextFormField(
          // ignore: body_might_complete_normally_nullable
          validator: (data) {
            if(data!.isEmpty){return "field is required";}
          },
          onChanged: onchanged,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 119, 117, 117),
                  fontWeight: FontWeight.w300),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.black)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
        )
      ],
    );
  }
}
