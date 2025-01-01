import 'package:e_store/common/widget/custom_shades/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class ECurvedEdgesWidget extends StatelessWidget {
  const ECurvedEdgesWidget({
    super.key,
    required this.child
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ECustomCurvedEdges(),
      child:child,

    );
  }
}

