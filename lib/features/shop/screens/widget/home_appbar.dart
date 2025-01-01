import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/common/widget/global/shimmer.dart';
import 'package:e_store/common/widget/product/cart/cart_menu_icon.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../personalization/controllers/user_controller.dart';

class EHomeAppBar extends StatelessWidget {
  const EHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ETexts.homeAppBarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: EColors.grey)),
          Obx((){
            if(controller.profileLoading.value){
              return const EShimmerEffect(width: 80, height: 15);
            }else{
              return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white));
            }
          }),
        ],
      ),
      actions: [
        ECartCounterIcon(onPressed: (){},iconColor: EColors.white,)
      ],
    );
  }
}

