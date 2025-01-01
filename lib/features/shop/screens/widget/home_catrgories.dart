import 'package:e_store/common/widget/image_text/vertical_image_text.dart';
import 'package:e_store/features/shop/screens/sub_category/sub_category.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return EVerticalImageText(image: EImage.shoeIcon, title: 'Shoes categories',onTap: ()=> Get.to(const SubCategoryScreen()),);
          }),
    );
  }
}

