import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/features/shop/screens/product_reviews/rating_progress_indicator.dart';
import 'package:e_store/features/shop/screens/product_reviews/user_review_card.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/product/rating/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- AppBar
      appBar: const EAppBar(title: Text('Reviews & Rating'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Rating and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: ESizes.spaceBtwItems),

              //-- overall product rating
              const EOverallProductRating(),
              const ERatingIndicator(rating: 3.5,),
              Text('12,119',style:Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ESizes.spaceBtwSection),

              // user review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),


            ],
          ),
        ),
      ),
    );
  }
}

