class AuthValidators {
  static String? businessName(String? businessName) {
    if (businessName!.isEmpty) {
      return "Registered business name";
    }
    return null;
  }

  static String? username(String? username) {
    if (username!.isEmpty) {
      return "Username required";
    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
      return "Only include alpha-numeric, _";
    }

    return null;
  }

  static String? pancardValidator(String? pancardNumber) {
    if (pancardNumber!.isEmpty) {
      return "Pancard number required";
    } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(pancardNumber)) {
      return "Enter valid pancard number";
    } else {
      return null;
    }
  }

  static String? businessOwnerName(String? ownerName) {
    if (ownerName!.isEmpty) {
      return "Full name of business owner";
    }
    return null;
  }

  static String? mobileNumber(String? number) {
    if (number!.isEmpty) {
      return "Visible to customers & OTP verification";
    }
    if (number.length != 10) {
      return "Enter valid number";
    }
    return null;
  }

  static String? emailID(String? value) {
    if (value!.isEmpty) {
      return "Email of your business";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Enter valid email";
    }
    return null;
  }

  static String? stateName(String? value) {
    if (value!.isEmpty) {
      return "State name";
    }

    return null;
  }

  static String? cityName(String? value) {
    if (value!.isEmpty) {
      return "City name";
    }

    return null;
  }

  static String? pincode(String? value) {
    if (value!.isEmpty || value.length != 6) {
      return "Enter your pincode";
    }

    return null;
  }

  static String? districtName(String? value) {
    if (value!.isEmpty) {
      return "Enter your district name";
    }

    return null;
  }

  static String? addressLaneOne(String? value) {
    if (value!.isEmpty) {
      return "Location of your business";
    }

    return null;
  }

  static String? addressLaneTwo(String? value) {
    if (value!.isEmpty) {
      return "Location of your business";
    }

    return null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return "Enter a valid password";
    }

    if (value.length < 7 || !value.contains(RegExp(r'[0-9]'))) {
      return "Min 7 characters (alpha-numeric)";
    }

    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value!.isEmpty || value != password) {
      return "Should match above password";
    }

    return null;
  }
}
