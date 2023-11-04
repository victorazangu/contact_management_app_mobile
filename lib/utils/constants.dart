class Constants {
  // auth
  static const register = "http://127.0.0.1:8000/api/v1/register";
  static const login = "http://127.0.0.1:8000/api/v1/login";
  static const profile = "http://127.0.0.1:8000/api/v1/profile";
  static const logout = "http://127.0.0.1:8000/api/v1/logout";
  static const updateProfilePicture =
      "http://127.0.0.1:8000/api/v1/profile/update-profile";
  static const updateUserProfile =
      "http://127.0.0.1:8000/api/v1/profile";

  // contacts
  static const multipleContacts = "http://127.0.0.1:8000/api/v1/contacts";
  static String singleContacts(int contact_id) {
    return 'http://127.0.0.1:8000/api/v1/contacts/$contact_id';
  }

  // group

  static const multipleGroups = "http://127.0.0.1:8000/api/v1/groups";
  static String singleGroups(int group_id) {
    return 'http://127.0.0.1:8000/api/v1/groups/$group_id';
  }

  //  add and remove contact to group

  static String addContactToGroup(int group_id, int contact_id) {
    return 'http://127.0.0.1:8000/api/v1/groups/$group_id/add-contact/$contact_id';
  }

  static String removeContactFromGroup(int group_id, int contact_id) {
    return 'http://127.0.0.1:8000/api/v1/groups/$group_id/remove-contact/$contact_id';
  }
}
