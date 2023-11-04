import "package:contact_management_app_mobile/utils/styles.dart";
import "package:flutter/material.dart";
import "../../services/group_service.dart";
import "../../utils/defaultValues.dart";

class ContactCardGroup extends StatefulWidget {
  final String contact;
  final int contact_id;
  final int group_id;

  ContactCardGroup({
    Key? key,
    required this.contact,
    required this.contact_id,
    required this.group_id,
  }) : super(key: key);

  @override
  State<ContactCardGroup> createState() => _ContactCardGroupState();
}

class _ContactCardGroupState extends State<ContactCardGroup> {
  final GroupWebService _groupWebService = GroupWebService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void handleRemove() async {
      try {
        var data = await _groupWebService.removeContactFromGroup(
          widget.group_id,
          widget.contact_id,
        );
        if (data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(data['message']),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error. Please try again.'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print('Error occurred: $e');
      }
    }

    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DefaultValues.mainPrimaryColor,
        image: const DecorationImage(
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
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 30,
                        color: DefaultValues.mainBackgroundColor,
                      ),
                      const SizedBox(width: 5),
                      Text(widget.contact, style: ThemeStyling.regular_14),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: handleRemove,
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
                          Icons.exposure_minus_1,
                          size: 30,
                          color: DefaultValues.mainBackgroundColor,
                        ),
                        SizedBox(width: 5),
                        Text("remove", style: ThemeStyling.regular_14),
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
