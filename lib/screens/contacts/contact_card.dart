import "package:contact_management_app_mobile/utils/styles.dart";
import "package:flutter/material.dart";
import "../../forms/add_contact_to_group.dart";
import "../../utils/defaultValues.dart";

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
              height: 40,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: DefaultValues.mainPrimaryColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: DefaultValues.mainBackgroundColor,
                      ),
                      SizedBox(width: 5),
                      Text("+24554444444444", style: ThemeStyling.regular_14),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    color: DefaultValues.mainPrimaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close),
                              color: Colors.white,
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                        AddContactToGroupForm(),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DefaultValues.mainPrimaryColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: DefaultValues.mainBackgroundColor,
                        ),
                        SizedBox(width: 5),
                        Text("to group", style: ThemeStyling.regular_14),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
