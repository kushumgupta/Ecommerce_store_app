import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/product/sortable/sortable_product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(title: Text('Popular Products'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child:ESortableProducts() ,
        ),
      ),
    );
  }
}

