import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/colors.dart';
import 'package:flutter_food_delivery_ui/constant.dart';
import 'package:flutter_food_delivery_ui/style.dart';
import 'package:flutter_svg/svg.dart';


class FoodDetail extends StatelessWidget {
  final String imagePath;
  const FoodDetail(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () => {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
               PrimaryText(
                text: 'Place an Order',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(10.0)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrimaryText(
                  text: 'Primavera \nPizza',
                  size: 45,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/dollar.svg',
                      color: AppColors.tertiary,
                      width: 15,
                    ),
                    const PrimaryText(
                      text: '5.99',
                      size: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiary,
                      height: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     SizedBox(
                      child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const PrimaryText(
                              text: 'Size',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const PrimaryText(
                                text: 'Medium 14"',
                                fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              text: 'Crust',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const PrimaryText(
                                text: 'Thin Crust',
                                fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              text: 'Delivery in',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const PrimaryText(
                                text: '30 min', fontWeight: FontWeight.w600),
                          ]),
                    ),
                    Hero(
                      tag: imagePath,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey[400], blurRadius: 30),],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 200,
                        child:
                            Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const PrimaryText(
                    text: 'Ingredients', fontWeight: FontWeight.w700, size: 22),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                child: ingredientCard(ingredients[index]['imagePath']),
              ),
            ),
          ),
          const SizedBox(height: 100,)
        ],
      ),
    );
  }

  Container ingredientCard(String imagePath) {
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.grey[300]),
            ]),
        child: Image.asset(
          imagePath,
          width: 90,
        ));
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey[400])),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.star, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
