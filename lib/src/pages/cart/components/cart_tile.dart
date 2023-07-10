import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widgets.dart';
import 'package:greengrocer/src/sevices/utils_services.dart';

import '../../../models/cart_item_model.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

   CartTile({super.key, required this.cartItem});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        // imagem

        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        // Titulo

        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        // Total

        subtitle: Text(
         utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade

        trailing: QuantityWidget(
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          result: (quantity) {},
        ),
      ),
    );
  }
}
