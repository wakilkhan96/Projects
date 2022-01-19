import 'package:flutter/material.dart';
class CustomDropDown extends StatelessWidget {
  final value;
  final List<String> itemsList;
  String? hintText;
  Color? dropdownColor;
  final Function(dynamic value) onChanged;



  CustomDropDown({
    required this.value,
    required this.itemsList,
    this.hintText,
    this.dropdownColor,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14),
            child: DropdownButton(
              hint: hintText==null? null : Text(hintText!),
              isExpanded: true,
              dropdownColor: dropdownColor,
              value: value,
              items: itemsList
                  .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
                  .toList(),
              onChanged: (value) => onChanged(value),
            ),
          ),
        ),
      ),
    );
  }
}