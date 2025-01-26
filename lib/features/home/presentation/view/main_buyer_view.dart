import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/custom_my_clip.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_search_text_field.dart';

class MainBuyerView extends StatefulWidget {
  const MainBuyerView({super.key});

  @override
  State<MainBuyerView> createState() => _MainBuyerViewState();
}

class _MainBuyerViewState extends State<MainBuyerView> {
  late final TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClip(),
            child: Container(
              color: AppColors.primaryColor,
              height: Dimensions.height130(context) * 2.8,
              child: Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.height45(context),
                  right: Dimensions.height20(context),
                  left: Dimensions.height20(context),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Delivery to Helwan",
                              style: Styles.textStyle15(context).copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: Dimensions.height10(context) * 0.5),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                Dimensions.height20(context) * 5),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            enableFeedback: false,
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20(context)),
                    CustomSearchTextField(
                      controller: _search,
                      onChange: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height130(context) * 1.9,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.height20(context)),
              child: Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.only(bottom: Dimensions.height10(context)),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20(context)),
                        color: AppColors.whiteGray,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.height130(context),
                            height: Dimensions.height130(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    Dimensions.radius20(context)),
                                bottomLeft: Radius.circular(
                                    Dimensions.radius20(context)),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/person.jpg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
