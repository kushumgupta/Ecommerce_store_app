import 'package:e_store/common/widget/custom_shades/containers/circular_container.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EChoiceChip extends StatelessWidget {
  const EChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor =  EHelperFunction.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? EColors.white : null),
        avatar: isColor
            ? ECircularContainer(
                width: 50,
                height: 50,
                backgroundColor: EHelperFunction.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ?  const EdgeInsets.all(0): null,
        padding: isColor ? const EdgeInsets.all(0): null,
        backgroundColor:isColor ? EHelperFunction.getColor(text)! : null,
      ),
    );
  }
}
