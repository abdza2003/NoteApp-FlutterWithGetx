import 'package:flutter/material.dart';
import 'package:sampleproject/Theme/Themes.dart';

class inputFaild extends StatelessWidget {
  TextEditingController? textEditingController;
  int? maxLength;
  int? maxLines;
  String title;
  String hintText;
  Widget? suffixIcon;
  inputFaild({
    this.maxLength,
    this.maxLines,
    required this.title,
    this.textEditingController,
    required this.hintText,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}',
            style: Themes().headLine3.copyWith(
                  fontSize: MediaQuery.of(context).size.width / (16.6),
                ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: textEditingController,
            readOnly: suffixIcon == null ? false : true,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: '${hintText}',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 112, 123),
                ),
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
