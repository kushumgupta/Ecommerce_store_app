import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/common/widget/brand/brand_card.dart';
import 'package:e_store/common/widget/product/sortable/sortable_product.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
            EBrandCard(showBorder: true),
            SizedBox(height: ESizes.spaceBtwSection),
            ESortableProducts(),
          ],
        ),),
      ),
    );
  }
}
