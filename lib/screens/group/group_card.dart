import "package:contact_management_app_mobile/utils/styles.dart";
import "package:flutter/material.dart";
import "../../utils/defaultValues.dart";

class GroupCard extends StatelessWidget {
  const GroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DefaultValues.mainPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/default.png',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: DefaultValues.mainPrimaryColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.group,
                        size: 30,
                        color: DefaultValues.mainBackgroundColor,
                      ),
                      SizedBox(width: 5),
                      Text("Group Name", style: ThemeStyling.regular_14),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
