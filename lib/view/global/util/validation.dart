class FormValidators {

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter a name';
    }

    final RegExp nameRegex = RegExp(r'^[A-Za-z\s]+$');

    if (!nameRegex.hasMatch(name)) {
      return 'Invalid name. Please use letters and spaces only';
    }

    return null; // Name is valid
  }


  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address';
    }

    if (!email.contains('@') || email.indexOf('@') == 0) {
      return 'Invalid email address.';
    }

    final dotIndex = email.lastIndexOf('.');
    if (dotIndex == -1 || dotIndex <= email.indexOf('@')) {
      return 'Invalid email address.';
    }

    return null; // Email is valid
  }


  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Please enter a phone number';
    }

    final RegExp phoneRegex = RegExp(r'^\d{10,15}$');

    if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Invalid phone number. Please enter a valid phone number.';
    }

    return null; // Phone number is valid
  }


  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null; //
  }

}
