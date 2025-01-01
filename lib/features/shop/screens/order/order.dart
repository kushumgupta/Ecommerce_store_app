import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/features/shop/screens/order/order_list.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(title: Text('My Order', style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: const Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
        child: EOrderListItems(),
      ),
    );
  }
}
