import 'package:flutter/material.dart';
class CustomDropDownInt extends StatelessWidget {
  final value;
  final List<int> itemsList;
  String? hintText;
  Color? dropdownColor;
  final Function(dynamic value) onChanged;



  CustomDropDownInt({
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
      padding: EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: DropdownButton(
              hint: hintText==null? null : Text(hintText!),
              isExpanded: true,
              dropdownColor: dropdownColor,
              value: value,
              items: itemsList
                  .map((int item) => DropdownMenuItem<int>(
                value: item,
                child: Text(item.toString()),
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