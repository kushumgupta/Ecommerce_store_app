import 'package:e_store/common/widget/custom_shades/containers/circular_container.dart';
import 'package:e_store/common/widget/custom_shades/curved_edges/Curved_edges_widget.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key,
    required this.child
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ECurvedEdgesWidget(
      child: Container(
        color: EColors.primary,
        padding: const EdgeInsets.all(0),
        child: Container(
          color: EColors.primary,
          child: Stack(
            children: [
              Positioned(top: -150,right: -250,child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1),)),
              Positioned(top: 100,right: -300,child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1),)),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

