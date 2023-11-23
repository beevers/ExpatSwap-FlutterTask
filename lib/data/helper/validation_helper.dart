class ValidationHelper {
  static String? isValidInput(String? data,
      {int? minLength = 1, int? maxLength}) {
    if (data == null) return 'Input is empty';
    data = data.trim();
    if (data.isEmpty) return 'Input is empty';
    if (data.length < (minLength == 5 ? 1 : minLength ?? 1)) {
      return 'Input is lesser than $minLength characters.';
    }
    if (maxLength != null) {
      if (data.length > maxLength) {
        return "Input must be at most $maxLength characters.";
      }
    }
    return null;
  }

  static String? isValidString(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp('[0-9]');
    if (charRegExp.hasMatch(data)) return 'Input is not valid';
    return null;
  }

  static String? isValidEmail(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!charRegExp.hasMatch(data)) return 'Input is not a valid email';
    return null;
  }

  static String? isValidPhoneNumber(String data,
      {int minLength = 11, int maxLength = 11}) {
    data = data.trim();
    String? result = isValidInput(
      data,
      minLength: minLength,
    );
    if (data.length > maxLength) {
      return "Input must be at most $maxLength digits";
    }
    if (data.length < minLength) {
      return "Input must be at least $minLength digits";
    }
    if (result != null) return result;

    // ignore: unused_local_variable
    final RegExp charRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    // if(!charRegExp.hasMatch(data)) return 'Input is not a valid mobile number';
    return null;
  }
}
