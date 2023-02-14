// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../utils/colors.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  const MultiSelectChip(this.reportList, {super.key});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  late String selectedChoice = widget.reportList[0];
  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = [];

    for (var item in widget.reportList) {
      bool isSelectedItem = selectedChoice == item;
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: primaryColor,
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade200),
          label: Text(
            item,
            style: TextStyle(
                color: isSelectedItem ? white : black,
                fontWeight: isSelectedItem ? FontWeight.w500 : FontWeight.w600),
          ),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
