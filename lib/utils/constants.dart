class Constants {
  // auth
  static const register = "http://10.0.2.2:8000/api/v1/register";
  static const login = "http://10.0.2.2:8000/api/v1/login";
  static const profile = "http://10.0.2.2:8000/api/v1/profile";
  static const logout = "http://10.0.2.2:8000/api/v1/logout";
  static const updateProfilePicture =
      "http://10.0.2.2:8000/api/v1/profile/update-profile";
  static const updateUserProfile = "http://10.0.2.2:8000/api/v1/profile";

  // contacts
  static const multipleContacts = "http://10.0.2.2:8000/api/v1/contacts";
  static String singleContacts(int contact_id) {
    return 'http://10.0.2.2:8000/api/v1/contacts/$contact_id';
  }

  // group

  static const multipleGroups = "http://10.0.2.2:8000/api/v1/groups";
  static String singleGroups(int group_id) {
    return 'http://10.0.2.2:8000/api/v1/groups/$group_id';
  }

  //  add and remove contact to group

  static String addContactToGroup(int group_id, int contact_id) {
    return 'http://10.0.2.2:8000/api/v1/groups/$group_id/add-contact/$contact_id';
  }

  static String removeContactFromGroup(int group_id, int contact_id) {
    return 'http://10.0.2.2:8000/api/v1/groups/$group_id/remove-contact/$contact_id';
  }
}
