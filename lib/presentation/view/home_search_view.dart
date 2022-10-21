import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_form_field.dart';

class HomeSearchView extends StatelessWidget {
  const HomeSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 50,
        bottom: 22,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              suffix: const Icon(
                Icons.search,
                color: AppColor.lightGrey,
                size: 27,
              ),
              margin: EdgeInsets.zero,
              textAlignVertical: TextAlignVertical.center,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              fontSize: 17,
              height: 50,
              hint: 'Search',
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(2, 2),
                )
              ],
              controller: searchController,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            width: 50,
            height: 50,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.white,
              boxShadow: const [
                BoxShadow(
                  color: AppColor.blackShadow,
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Image.asset(
                    'assets/images/search_icon.png',
                    width: 16,
                    height: 18.15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
