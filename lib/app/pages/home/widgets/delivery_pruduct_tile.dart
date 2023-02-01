// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/app/core/formater-extensions/formater_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/colors.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/app/models/product_model.dart';

class DeliveryPruductTile extends StatelessWidget {
  final ProductModel product;
  const DeliveryPruductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.name,
                    style:
                        context.textStyles.texExtratBold.copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.description,
                    style: context.textStyles.textRegular.copyWith(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.price.currencyPTBR,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 12,
                      color: context.colors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: product.image,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
