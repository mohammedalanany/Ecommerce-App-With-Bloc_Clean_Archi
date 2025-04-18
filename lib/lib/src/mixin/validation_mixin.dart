import 'package:flutter/material.dart';
import 'package:round/src/helpers/app_translations.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  // RegExp _email = RegExp(
  //     r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
  RegExp _numeric = RegExp(r'^-?[0-9]+$');

  RegExp _email = RegExp(
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");
  String? validateValue(String value) {
    if (value.length == 0)
      return AppLocalizations.of(context)!.emailOrPhoneValidate;
    else if (_numeric.hasMatch(value)) {
      if (value.length == 9 || value.length == 10)
        return null;
      else
        return AppLocalizations.of(context)!.phoneValidate;
    } else {
      if (!_email.hasMatch(value)) {
        return AppLocalizations.of(context)!.emailValidate;
      }
    }
    return null;
  }

  String? validateEmail(String email) {
    if (!_email.hasMatch(email))
      return AppLocalizations.of(context)!.emailValidate;
    else
      return null;
  }

  String? validateAddressType(String username) {
    if (username.length == 0) {
      return 'Please write Your address type';
    } else {
      return null;
    }
  }

  String? validateComment(String comment) {
    if (comment.length == 0) {
      return 'Please write Your comment';
    } else {
      return null;
    }
  }

  String? validateStreetName(String username) {
    if (username.length == 0) {
      return 'Please write Your Street name';
    } else {
      return null;
    }
  }

  String? validateBuildingNumber(String username) {
    if (username.length == 0) {
      return 'Please write Your building number';
    } else {
      return null;
    }
  }
//
//   String validateDescription(String description) {
//     if (description.length == 0) {
//       return Localizations.localeOf(context).languageCode == 'ar' ? 'من فضلك قم بكتابه رسالتك ':'please write your message';
//     } else {
//       return null;
//     }
//   }

  String? validateCcv(String username) {
    if (username.length == 0) {
      return 'قم بإدخال ال ccv';
    } else {
      return null;
    }
  }

  // String validateAddress(String address) {
  //   if (address.length == 0) {
  //     return '${AppLocalizations.of(context).pleaseEnter} address';
  //   } else {
  //     return null;
  //   }
  // }
  String? validateRegion(id) {
    if (id == null || id == 0) {
      return 'please choose your region';
    } else {
      return null;
    }
  }

  String? validateState(id) {
    if (id == null || id == 0) {
      return 'please choose your state';
    } else {
      return null;
    }
  }

  String? validateQuantity(id) {
    if (id == null || id == 0) {
      return 'please choose the quantity';
    } else {
      return null;
    }
  }

  String? validateDealValue(String username) {
    if (username.length == 0) {
      return 'قم بإدخال قيمة العقد';
    } else {
      return null;
    }
  }

  String? validateSupportValue(String username) {
    if (username.length == 0) {
      return 'قم بإدخال القيمة المطلوبة للدعم';
    } else {
      return null;
    }
  }

  String? validateCard(String username) {
    if (username.length == 0) {
      return 'قم بإدخال رقم البطاقه';
    } else {
      return null;
    }
  }

  String? validateHolder(String username) {
    if (username.length == 0) {
      return 'قم بإدخال اسم المحول';
    } else {
      return null;
    }
  }

  String? validatePrice(String username) {
    if (username.length == 0) {
      return 'قم بإدخال السعر';
    } else {
      return null;
    }
  }

  String? validateTitle(String username) {
    if (username.length == 0) {
      return 'قم بإدخال العنوان';
    } else {
      return null;
    }
  }

  String? validateArea(String username) {
    if (username.length == 0) {
      return 'قم بإدخال المساحه';
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    bool hasNum = false;
    if (password!.length < 8)
      return '${AppLocalizations.of(context)!.validatePassword}';
    if (_numeric.hasMatch(password))
      return 'Password mustn\'t contain numbers only';
    if (password.toLowerCase() == password)
      return 'Password must contain 1 uppercase letter at least';
    password.characters.forEach((element) {
      if (_numeric.hasMatch(element)) hasNum = true;
    });
    if (!hasNum) return 'Password must contain 1 number at least';
    return null;
  }

  String? validateShortPassword(String? password) {
    if (password!.length < 5)
      return '${AppLocalizations.of(context)!.validatePassword}';

    return null;
  }

  String? validateUsername(String username) {
    if (username.length == 0) {
      return '${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.name}';
    } else {
      return null;
    }
  }

  String? validateAgentName(String username) {
    if (username.length == 0) {
      return '${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.name}';
    } else {
      return null;
    }
  }

  String? validateCountry(countryId) {
    if (countryId < 1) {
      return '${AppLocalizations.of(context)!.pleaseChoose} ${AppLocalizations.of(context)!.country}';
    } else {
      return null;
    }
  }

  String? validatePosition(positionId) {
    if (positionId < 1) {
      return '${AppLocalizations.of(context)!.pleaseChoose} ${AppLocalizations.of(context)!.playerPosition}';
    } else {
      return null;
    }
  }

  String? validatePrice0(String username) {
    if (username.length == 0) {
      return 'من فضلك قم بإدخال المبلغ المحول';
    } else {
      return null;
    }
  }

  String? validateDescription(String description) {
    if (description.length == 0) {
      return 'قم بإدخال وصف الاعلان';
    } else {
      return null;
    }
  }
  // String validateProperTime(String properTime) {
  //   if (properTime.length == 0) {
  //     return '${AppLocalizations.of(context).pleaseEnter} ${AppLocalizations.of(context).properTimeToCall}';
  //   } else {
  //     return null;
  //   }
  // }
  // String validateNationalNumber(String number) {
  //   if (number.length == 0) {
  //     return '${AppLocalizations.of(context).pleaseEnter} ${AppLocalizations.of(context).idNumber}';
  //   } else {
  //     return null;
  //   }
  // }
  // String validateSalary(String salary) {
  //   if (salary.length == 0) {
  //     return '${AppLocalizations.of(context).pleaseEnter} ${AppLocalizations.of(context).salary}';
  //   } else {
  //     return null;
  //   }
  // }
  // String validateRequiredMoney(String salary) {
  //   if (salary.length == 0) {
  //     return '${AppLocalizations.of(context).pleaseEnter} ${AppLocalizations.of(context).salary}';
  //   } else {
  //     return null;
  //   }
  // }

  String? validatePhone(String phone) {
    print(phone);
    if (phone.length == 0) {
      return '${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.phone}';
    } else if (!(phone.length == 9 || phone.length == 10)) {
      return '${AppLocalizations.of(context)!.phoneValidate3}';
    } else if (!_numeric.hasMatch(phone)) {
      return '${AppLocalizations.of(context)!.phoneValidate2}';
    } else {
      return null;
    }
  }

//  String validatePassword(String password) {
//    return password.length > 5
//        ? null
//        : '${AppLocalizations.of(context).validatePassword}';
//  }
//  String validateLoginValue(String value) {
//    if (value.length == 0) {
//      return '${AppLocalizations.of(context).pleaseEnter} ${AppLocalizations.of(context).emailOrMobileNumber}';
//    } else {
//      return null;
//    }
//  }
  String? validateAddress(String address) {
    if (address.length == 0) {
      return '${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.address}';
    } else {
      return null;
    }
  }

//  String validateActivationCode(String code) {
//    return code.length == 4
//        ? null
//        : '${AppLocalizations.of(context).validateActivationCode}';
//  }
//  String validateSubject(String subject) {
//    if (subject.length == 0) {
//      return '${AppLocalizations.of(context).pleaseEnter} ${AppLocalizations.of(context).messageTitle}';
//    } else {
//      return null;
//    }
//  }
}
