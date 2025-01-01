import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Form(
            child:Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),),
                const SizedBox(height: ESizes.spaceBtmInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),),
                const SizedBox(height: ESizes.spaceBtmInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),)),
                    const SizedBox(height: ESizes.spaceBtmInputFields,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'),)),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtmInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),)),
                    const SizedBox(height: ESizes.spaceBtmInputFields,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),)),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtmInputFields,),
                Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),)),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child:const Text('Save')),)

              ],
            )
        ),
      ),
    );
  }
}
