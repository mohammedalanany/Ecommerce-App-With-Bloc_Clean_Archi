import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:round/l10n/messages_all.dart';

class AppLocalizations {
  AppLocalizations(this.localeName);

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final String localeName;
  bool get isArabic => this.localeName == 'ar';

  // my wallet screen // StoreMainScreen // StoreMoreScreen
  // cart screen //PaymentMethodScreen // PaymentDataScreen
  //Other Sellers
//Password Changed Successfully




  String get theCodeWillBeSentToYourEmail => Intl.message(
          'The code will be sent to your email',
          name: 'theCodeWillBeSentToYourEmail',
          desc: 'Translation for the word The code will be sent to your email',
          locale: localeName,
        );
  String get theCodeWillBeSentToYourMobileNumber => Intl.message(
          'The code will be sent to your mobile number',
          name: 'theCodeWillBeSentToYourMobileNumber',
          desc: 'Translation for the word The code will be sent to your mobile number',
          locale: localeName,
        );
  String get resendCode => Intl.message(
          'Resend code',
          name: 'resendCode',
          desc: 'Translation for the word Resend code',
          locale: localeName,
        );
  String get sec => Intl.message(
          'sec',
          name: 'sec',
          desc: 'Translation for the word sec',
          locale: localeName,
        );
  String get continueWithTwitter => Intl.message(
          'Continue with Twitter',
          name: 'continueWithTwitter',
          desc: 'Translation for the word Continue with Twitter',
          locale: localeName,
        );
  String get continueWithGoogle => Intl.message(
          'Continue with Google',
          name: 'continueWithGoogle',
          desc: 'Translation for the word Continue with Google',
          locale: localeName,
        );
  String get continueWithFacebook => Intl.message(
          'Continue with Facebook',
          name: 'continueWithFacebook',
          desc: 'Translation for the word Continue with Facebook',
          locale: localeName,
        );
  String get userCancelledLogin => Intl.message(
          'User cancelled login',
          name: 'userCancelledLogin',
          desc: 'Translation for the word User cancelled login',
          locale: localeName,
        );
  String get errorWhileLogin => Intl.message(
          'Error while login',
          name: 'errorWhileLogin',
          desc: 'Translation for the word Error while login',
          locale: localeName,
        );
  String get paymentError => Intl.message(
          'Payment error',
          name: 'paymentError',
          desc: 'Translation for the word Payment error',
          locale: localeName,
        );
  String get paymentCancelled => Intl.message(
          'Payment cancelled',
          name: 'paymentCancelled',
          desc: 'Translation for the word Payment cancelled',
          locale: localeName,
        );
  String get payWith => Intl.message(
          'Pay With',
          name: 'payWith',
          desc: 'Translation for the word Pay With',
          locale: localeName,
        );
  String get choosePaymentText => Intl.message(
          'Choose one of the available payment methods\nVisa - Master Card or Mada',
          name: 'choosePaymentText',
          desc: 'Translation for the word Choose one of the available payment methods\nVisa - Master Card or Mada',
          locale: localeName,
        );
  String get totalCost => Intl.message(
          'Total Cost',
          name: 'totalCost',
          desc: 'Translation for the word Total Cost',
          locale: localeName,
        );
  String get payment => Intl.message(
          'Payment',
          name: 'payment',
          desc: 'Translation for the word Payment',
          locale: localeName,
        );
  String get passwordChangedSuccessfully => Intl.message(
    'Password Changed Successfully',
    name: 'passwordChangedSuccessfully',
    desc: 'Translation for the word Password Changed Successfully',
    locale: localeName,
  );

  String get passwordChangedSuccessfullyText => Intl.message(
    'your account will be logged out of all devices and you can log-in again',
    name: 'passwordChangedSuccessfullyText',
    desc: 'Translation for the word your account will be logged out of all devices and you can log-in again',
    locale: localeName,
  );
  //
  String get mrsool => Intl.message(
    'Mrsool ',
    name: 'mrsool',
    desc: 'Translation for the word Mrsool ',
    locale: localeName,
  );
  String get expressDelivery => Intl.message(
    'express delivery',
    name: 'expressDelivery',
    desc: 'Translation for the word express delivery',
    locale: localeName,
  );
  String get estimatedDeliveryTime => Intl.message(
    'Estimated Delivery Time',
    name: 'estimatedDeliveryTime',
    desc: 'Translation for the word Estimated Delivery Time',
    locale: localeName,
  );
  String get hr => Intl.message(
    'Hr',
    name: 'hr',
    desc: 'Translation for the word Hr',
    locale: localeName,
  );
  String get shippingCompanies  => Intl.message(
    'shipping companies ',
    name: 'shippingCompanies',
    desc: 'Translation for the word shipping companies ',
    locale: localeName,
  );
  String get slowDelivery => Intl.message(
    'slow delivery',
    name: 'slowDelivery',
    desc: 'Translation for the word slow delivery',
    locale: localeName,
  );
  String get day => Intl.message(
    'day',
    name: 'day',
    desc: 'Translation for the word day',
    locale: localeName,
  );

  //
  String get delete => Intl.message(
    'Delete',
    name: 'delete',
    desc: 'Translation for the word Delete',
    locale: localeName,
  );
  String get deleteAgree => Intl.message(
    'Yes... remove it',
    name: 'deleteAgree',
    desc: 'Translation for the word Yes.. Delete',
    locale: localeName,
  );
  String get deleteRefuse => Intl.message(
    'No.. keep it',
    name: 'deleteRefuse',
    desc: 'Translation for the word No.. keep it',
    locale: localeName,
  );
  String get deleteText => Intl.message(
    'Are you sure you want remove\nthis item form your cart ?',
    name: 'deleteText',
    desc: 'Translation for the word Are you sure you want remove\nthis item form your cart ?',
    locale: localeName,
  );
  String get setAsDefault => Intl.message(
    'Set as default',
    name: 'setAsDefault',
    desc: 'Translation for the word Set as default',
    locale: localeName,
  );
  String get status => Intl.message(
    'Status',
    name: 'status',
    desc: 'Translation for the word Status',
    locale: localeName,
  );
  String get rate => Intl.message(
    'Rate',
    name: 'rate',
    desc: 'Translation for the word Rate',
    locale: localeName,
  );
  String get returnProduct => Intl.message(
    'Return Product',
    name: 'returnProduct',
    desc: 'Translation for the word Return Product',
    locale: localeName,
  );
  String get shippingMethod => Intl.message(
    'Shipping Method',
    name: 'shippingMethod',
    desc: 'Translation for the word Shipping Method',
    locale: localeName,
  );
  String get numberShipment  => Intl.message(
    'NUMBER OF SHIPMENTS',
    name: 'numberShipment',
    desc: 'Translation for the word NUMBER OF SHIPMENTS',
    locale: localeName,
  );

  //
  String get canceled => Intl.message(
    'Canceled',
    name: 'canceled',
    desc: 'Translation for the word Canceled',
    locale: localeName,
  );
  String get ready => Intl.message(
    'Ready',
    name: 'ready',
    desc: 'Translation for the word Ready',
    locale: localeName,
  );
  String get shipped => Intl.message(
    'Shipped',
    name: 'shipped',
    desc: 'Translation for the word Shipped',
    locale: localeName,
  );
  String get delivery => Intl.message(
    'Delivery',
    name: 'delivery',
    desc: 'Translation for the word Delivery',
    locale: localeName,
  );
  String get delivered => Intl.message(
    'Delivered',
    name: 'delivered',
    desc: 'Translation for the word Delivered',
    locale: localeName,
  );
  String get inProgress => Intl.message(
    'In Progress',
    name: 'inProgress',
    desc: 'Translation for the word In Progress',
    locale: localeName,
  );
  String get quantity => Intl.message(
    'Quantity:',
    name: 'quantity',
    desc: 'Translation for the word Quantity:',
    locale: localeName,
  );
  String get changeIt => Intl.message(
    'Change it',
    name: 'changeIt',
    desc: 'Translation for the word Change it',
    locale: localeName,
  );
  String get removeItem => Intl.message(
    'Remove Item',
    name: 'removeItem',
    desc: 'Translation for the word Remove Item',
    locale: localeName,
  );
  //Remove Item
  String get hotDeals => Intl.message(
    "Hot Deals",
    name: 'hotDeals',
    desc: 'Translation for the word Hot Deals',
    locale: localeName,
  );
  String get sortBy => Intl.message(
    "Sort by",
    name: 'sortBy',
    desc: 'Translation for the word Sort by',
    locale: localeName,
  );
  String get theClosest => Intl.message(
    "The Closest",
    name: 'theClosest',
    desc: 'Translation for the word The Closest',
    locale: localeName,
  );
  String get topRated => Intl.message(
    "Top Rated",
    name: 'topRated',
    desc: 'Translation for the word Top Rated',
    locale: localeName,
  );
  String get priceFilter1 => Intl.message(
    "Price (High to Low)",
    name: 'priceFilter1',
    desc: 'Translation for the word Price (High to Low)',
    locale: localeName,
  );
  String get priceFilter2 => Intl.message(
    "Price (Low to High)",
    name: 'priceFilter2',
    desc: 'Translation for the word Price (Low to High)',
    locale: localeName,
  );
  String get category => Intl.message(
    "Category",
    name: 'category',
    desc: 'Translation for the word Category',
    locale: localeName,
  );
  String get subCategory => Intl.message(
    "Sub-Category",
    name: 'subCategory',
    desc: 'Translation for the word Sub-Category',
    locale: localeName,
  );
  //
  String get from => Intl.message(
    "from",
    name: 'from',
    desc: 'Translation for the word from',
    locale: localeName,
  );
  String get thereAreNoResults => Intl.message(
    "There are no results",
    name: 'thereAreNoResults',
    desc: 'Translation for the word There are no results',
    locale: localeName,
  );
  String get ratings => Intl.message(
    "Ratings",
    name: 'ratings',
    desc: 'Translation for the word Ratings',
    locale: localeName,
  );
  String get productSearch => Intl.message(
    "Product Search",
    name: 'productSearch',
    desc: 'Translation for the word Product Search',
    locale: localeName,
  );
  String get compareNew => Intl.message(
    'Compare new',
    name: 'compareNew',
    desc: 'Translation for the word Compare new',
    locale: localeName,
  );
  //
  String get notLoggedIn => Intl.message(
    'Not Logged In',
    name: 'notLoggedIn',
    desc: 'Translation for the word Not Logged In',
    locale: localeName,
  );
  String get wishlistLoginText => Intl.message(
    'Log in first to add Products to your Wishlist.',
    name: 'wishlistLoginText',
    desc: 'Translation for the word Log in first to add Products to your Wishlist.',
    locale: localeName,
  );
  String get purchaseLoginText => Intl.message(
    'Log in first to add Products to your Purchases.',
    name: 'purchaseLoginText',
    desc: 'Translation for the word Log in first to add Products to your Purchases.',
    locale: localeName,
  );
  String get startShopping => Intl.message(
    'Start Shopping',
    name: 'startShopping',
    desc: 'Translation for the word Start Shopping',
    locale: localeName,
  );
  String get noOrdersText => Intl.message(
    "You have not added any orders yet, press the\nbutton and start shopping",
    name: 'noOrdersText',
    desc: "Translation for the word You have not added any orders yet, press the\nbutton and start shopping",
    locale: localeName,
  );
  String get noOrders => Intl.message(
    'No Orders',
    name: 'noOrders',
    desc: 'Translation for the word No Orders',
    locale: localeName,
  );
  String get myPurchases => Intl.message(
    'My Purchases',
    name: 'myPurchases',
    desc: 'Translation for the word My Purchases',
    locale: localeName,
  );
  String get myPurchases1 => Intl.message(
    'Purchases',
    name: 'myPurchases1',
    desc: 'Translation for the word Purchases',
    locale: localeName,
  );
  String get newOffers => Intl.message(
    'New Offers',
    name: 'newOffers',
    desc: 'Translation for the word New Offers',
    locale: localeName,
  );
  String get seeAll => Intl.message(
    'See all',
    name: 'seeAll',
    desc: 'Translation for the word See all',
    locale: localeName,
  );
  String get recommendedProducts => Intl.message(
    'Recommended Products',
    name: 'recommendedProducts',
    desc: 'Translation for the word Recommended Products',
    locale: localeName,
  );
  String get allSections => Intl.message(
    'All\nSections',
    name: 'allSections',
    desc: 'Translation for the word All\nSections',
    locale: localeName,
  );
  String get storeCategories => Intl.message(
    'Store Categories',
    name: 'storeCategories',
    desc: 'Translation for the word Store Categories',
    locale: localeName,
  );
  String get goHome => Intl.message(
    'Go Home',
    name: 'goHome',
    desc: 'Translation for the word Go Home',
    locale: localeName,
  );
  String get noFavoritesText => Intl.message(
    "You didn't add products to the WishList. Click on\nthe button to add favourite products.",
    name: 'noFavoritesText',
    desc: "Translation for the word You didn't add products to the WishList. Click on\nthe button to add favourite products.",
    locale: localeName,
  );
  String get noFavorites => Intl.message(
    'No favorites',
    name: 'noFavorites',
    desc: 'Translation for the word No favorites',
    locale: localeName,
  );
  //
  String get chooseYourDefaultAddress => Intl.message(
    'Choose your default address',
    name: 'chooseYourDefaultAddress',
    desc: 'Translation for the word Choose your default address',
    locale: localeName,
  );
  String get discountCouponOptional => Intl.message(
    'Discount Coupon (optional)',
    name: 'discountCouponOptional',
    desc: 'Translation for the word Discount Coupon (optional)',
    locale: localeName,
  );
  String get apply => Intl.message(
    'Apply',
    name: 'apply',
    desc: 'Translation for the word Apply',
    locale: localeName,
  );
  String get subtotal => Intl.message(
    'Subtotal',
    name: 'subtotal',
    desc: 'Translation for the word Subtotal',
    locale: localeName,
  );
  String get sar => Intl.message(
    'SAR',
    name: 'sar',
    desc: 'Translation for the word SAR',
    locale: localeName,
  );
  String get totalShippingCosts => Intl.message(
    'Shipping Fees',
    name: 'totalShippingCosts',
    desc: 'Translation for the word Shipping Fees',
    locale: localeName,
  );
  String get tax => Intl.message(
    'VAT',
    name: 'tax',
    desc: 'Translation for the word VAT',
    locale: localeName,
  );
  String get discount => Intl.message(
    'Discount',
    name: 'discount',
    desc: 'Translation for the word Discount',
    locale: localeName,
  );
  String get coupon => Intl.message(
    'Coupon',
    name: 'coupon',
    desc: 'Translation for the word Coupon',
    locale: localeName,
  );
  String get checkout => Intl.message(
    'Checkout',
    name: 'checkout',
    desc: 'Translation for the word Checkout',
    locale: localeName,
  );
  //
  String get barcodes => Intl.message(
    'Barcodes',
    name: 'barcodes',
    desc: 'Translation for the word Barcodes',
    locale: localeName,
  );
  String get howToUse => Intl.message(
    'How to use',
    name: 'howToUse',
    desc: 'Translation for the word How to use',
    locale: localeName,
  );
  String get benefits => Intl.message(
    'Benefits',
    name: 'benefits',
    desc: 'Translation for the word Benefits',
    locale: localeName,
  );
  String get features => Intl.message(
    'Features',
    name: 'features',
    desc: 'Translation for the word Features',
    locale: localeName,
  );
  String get uses => Intl.message(
    'Uses',
    name: 'uses',
    desc: 'Translation for the word Uses',
    locale: localeName,
  );

  //
  String get productDescription => Intl.message(
    'Product Description',
    name: 'productDescription',
    desc: 'Translation for the word Product Description',
    locale: localeName,
  );
  String get productInformation => Intl.message(
    'Product Information',
    name: 'productInformation',
    desc: 'Translation for the word Product Information',
    locale: localeName,
  );
  String get brand => Intl.message(
    'Brand',
    name: 'brand',
    desc: 'Translation for the word Brand',
    locale: localeName,
  );
  String get weight => Intl.message(
    'Weight',
    name: 'weight',
    desc: 'Translation for the word Weight',
    locale: localeName,
  );
  String get dimensions => Intl.message(
    'Dimensions',
    name: 'dimensions',
    desc: 'Translation for the word Dimensions',
    locale: localeName,
  );
  String get sKU => Intl.message(
    'SKU',
    name: 'sKU',
    desc: 'Translation for the word SKU',
    locale: localeName,
  );
  String get seeMore => Intl.message(
    'See More',
    name: 'seeMore',
    desc: 'Translation for the word See More',
    locale: localeName,
  );
  String get reviews => Intl.message(
    'Reviews',
    name: 'reviews',
    desc: 'Translation for the word Reviews',
    locale: localeName,
  );
  String get similarProducts => Intl.message(
    'Similar Products',
    name: 'similarProducts',
    desc: 'Translation for the word Similar Products',
    locale: localeName,
  );
  String get requiredQuantity => Intl.message(
    'Required Quantity',
    name: 'requiredQuantity',
    desc: 'Translation for the word Required Quantity',
    locale: localeName,
  );
  //Added to wishlist
  String get addedToWishlist => Intl.message(
    'Added to Wishlist',
    name: 'addedToWishlist',
    desc: 'Translation for the word Added to Wishlist',
    locale: localeName,
  );
  String get addToWishlist => Intl.message(
    'Add to Wishlist',
    name: 'addToWishlist',
    desc: 'Translation for the word Add to Wishlist',
    locale: localeName,
  );
  String get addToCart => Intl.message(
    'Add to cart',
    name: 'addToCart',
    desc: 'Translation for the word Add to cart',
    locale: localeName,
  );
  String get otherSellers => Intl.message(
    'Other Sellers',
    name: 'otherSellers',
    desc: 'Translation for the word Other Sellers',
    locale: localeName,
  );
  //
  String get setting => Intl.message(
    'Setting',
    name: 'setting',
    desc: 'Translation for the word Setting',
    locale: localeName,
  );
  String get notification => Intl.message(
    'Notifications',
    name: 'notification',
    desc: 'Translation for the word Notifications',
    locale: localeName,
  );
  String get verifiedTheMobileNumber => Intl.message(
    'Verified Mobile Number',
    name: 'verifiedTheMobileNumber',
    desc: 'Translation for the word Verified Mobile Number',
    locale: localeName,
  );
  String get verifiedTheEmail => Intl.message(
    'Verified Email',
    name: 'verifiedTheEmail',
    desc: 'Translation for the word Verified Email',
    locale: localeName,
  );
  String get enterYourCode => Intl.message(
    'Enter your code',
    name: 'enterYourCode',
    desc: 'Translation for the word Enter your code',
    locale: localeName,
  );
  String get sentDigitCode => Intl.message(
    "We`ve sent a 4-digit code",
    name: 'sentDigitCode',
    desc: "Translation for the word We`ve sent a 4-digit code",
    locale: localeName,
  );
  String get confirmYourEmailText => Intl.message(
    "We'll text you to confirm your email",
    name: 'confirmYourEmailText',
    desc: "Translation for the word We'll text you to confirm your email",
    locale: localeName,
  );
  String get confirmYourNumberText => Intl.message(
    "We'll text you to confirm your number",
    name: 'confirmYourNumberText',
    desc: "Translation for the word We'll text you to confirm your number",
    locale: localeName,
  );
  //Other Sellers
  String get leaveComment => Intl.message(
    'Leave a comment',
    name: 'leaveComment',
    desc: 'Translation for the word Leave a comment',
    locale: localeName,
  );
  //
  String get enterTheCodeWeSent => Intl.message(
    'Enter the code we sent',
    name: 'enterTheCodeWeSent',
    desc: 'Translation for the word Enter the code we sent',
    locale: localeName,
  );
  String get code => Intl.message(
    'Code',
    name: 'code',
    desc: 'Translation for the word Code',
    locale: localeName,
  );
  String get send => Intl.message(
    'Send',
    name: 'send',
    desc: 'Translation for the word Send',
    locale: localeName,
  );
  String get resetPassword => Intl.message(
    'Reset password',
    name: 'resetPassword',
    desc: 'Translation for the word Reset password',
    locale: localeName,
  );
  String get mBMax => Intl.message(
    '2MB Max',
    name: 'mBMax',
    desc: 'Translation for the word 2MB Max',
    locale: localeName,
  );
  String get changePicture => Intl.message(
    'Change Picture',
    name: 'changePicture',
    desc: 'Translation for the word Change Picture',
    locale: localeName,
  );
  String get myAccount => Intl.message(
    'My Account',
    name: 'myAccount',
    desc: 'Translation for the word My Account',
    locale: localeName,
  );
  String get sendYouAnActivationCode => Intl.message(
    "We'll send you an activation code",
    name: 'sendYouAnActivationCode',
    desc: "Translation for the word We'll send you an activation code",
    locale: localeName,
  );
  String get phoneNumberOrEmail => Intl.message(
    'Phone Number or Email',
    name: 'phoneNumberOrEmail',
    desc: 'Translation for the word Phone Number or Email',
    locale: localeName,
  );
//
  String get changePassword => Intl.message(
    'Change Password',
    name: 'changePassword',
    desc: 'Translation for the word Change Password',
    locale: localeName,
  );
  String get oldPassword => Intl.message(
    'Old Password',
    name: 'oldPassword',
    desc: 'Translation for the word Old Password',
    locale: localeName,
  );
  String get newPassword => Intl.message(
    'New Password',
    name: 'newPassword',
    desc: 'Translation for the word New Password',
    locale: localeName,
  );
  String get enterYourPassword => Intl.message(
    'Enter your password',
    name: 'enterYourPassword',
    desc: 'Translation for the word Enter your password',
    locale: localeName,
  );
  String get forgetPassword => Intl.message(
    'Forget Password',
    name: 'forgetPassword',
    desc: 'Translation for the word Forget Password',
    locale: localeName,
  );
  String get loginOrSignup => Intl.message(
    'Hey,\nLog in or Signup',
    name: 'loginOrSignup',
    desc: 'Translation for the word Hey,\nLog-in or Sign-up',
    locale: localeName,
  );
//
  String get agreeAndContinue => Intl.message(
    'Agree and continue',
    name: 'agreeAndContinue',
    desc: 'Translation for the word Agree and continue',
    locale: localeName,
  );
  String get belowIAgree => Intl.message(
    'below, you agree\n',
    name: 'belowIAgree',
    desc: 'Translation for the word below, you agree\n',
    locale: localeName,
  );
  String get toround => Intl.message(
    "to round's",
    name: 'toround',
    desc: "Translation for the word to round's",
    locale: localeName,
  );
  String get termsAndConditions1 => Intl.message(
    'Terms and Conditions',
    name: 'termsAndConditions1',
    desc: 'Translation for the word Terms and Conditions',
    locale: localeName,
  );
  String get agreeAndContinue1 => Intl.message(
    'Agree and continue',
    name: 'agreeAndContinue1',
    desc: 'Translation for the word Agree and continue',
    locale: localeName,
  );

  //
  String get newAddress => Intl.message(
    'New address',
    name: 'newAddress',
    desc: 'Translation for the word New address',
    locale: localeName,
  );
  String get youCantEditOrDeleteUntilTheRequestFinished => Intl.message(
    'You cant edit or delete until the request finished',
    name: 'youCantEditOrDeleteUntilTheRequestFinished',
    desc: 'Translation for the word You cant edit or delete until the request finished',
    locale: localeName,
  );
  String get addYourInfo => Intl.message(
    'Add your info',
    name: 'addYourInfo',
    desc: 'Translation for the word Add your info',
    locale: localeName,
  );
  String get userName => Intl.message(
    'User name',
    name: 'userName',
    desc: 'Translation for the word User name',
    locale: localeName,
  );
  String get theWordThisNameWillAppearOnYourAccount => Intl.message(
    'This name will appear on your account',
    name: 'theWordThisNameWillAppearOnYourAccount',
    desc: 'Translation for This name will appear on your account',
    locale: localeName,
  );
  String get dateOfBirth => Intl.message(
    'Date of birth',
    name: 'dateOfBirth',
    desc: 'Translation for the word Date of birth',
    locale: localeName,
  );
  String get birthDateText => Intl.message(
    "Others won't see your date of birth",
    name: 'birthDateText',
    desc: "Translation for the word Others won't see your date of birth",
    locale: localeName,
  );
  String get email => Intl.message(
    'Email',
    name: 'email',
    desc: 'Translation for the word Email',
    locale: localeName,
  );
  String get optional => Intl.message(
    'Optional',
    name: 'optional',
    desc: 'Translation for the word Optional',
    locale: localeName,
  );
  String get activationCodeWillBeSent => Intl.message(
    'Activation code will be sent',
    name: 'activationCodeWillBeSent',
    desc: 'Translation for the word Activation code will be sent',
    locale: localeName,
  );
  String get phone1 => Intl.message(
    'Phone',
    name: 'phone1',
    desc: 'Translation for the word Phone',
    locale: localeName,
  );
  String get password => Intl.message(
    'Password',
    name: 'password',
    desc: 'Translation for the word Password',
    locale: localeName,
  );
  String get reenterPassword => Intl.message(
    'Re-enter password',
    name: 'reenterPassword',
    desc: 'Translation for the word Re-enter password',
    locale: localeName,
  );
  String get passwordText => Intl.message(
    'password must be at least 8 characters long, contain at least 1 number and 1 uppercase letter',
    name: 'passwordText',
    desc: 'Translation for the word password must be at least 8 characters long, contain at least 1 number and 1 uppercase letter',
    locale: localeName,
  );
  String get bySelecting => Intl.message(
    'By selecting',
    name: 'bySelecting',
    desc: 'Translation for the word By selecting',
    locale: localeName,
  );
  //
  String get pleaseMarkYourLocationOnMap => Intl.message(
    '* Please mark your location on the map',
    name: 'pleaseMarkYourLocationOnMap',
    desc: 'Translation for the word * Please mark your location on the map',
    locale: localeName,
  );
  String get save => Intl.message(
    'Save',
    name: 'save',
    desc: 'Translation for the word Save',
    locale: localeName,
  );
  String get edit => Intl.message(
    'Edit',
    name: 'edit',
    desc: 'Translation for the word Edit',
    locale: localeName,
  );
  String get yourCurrentLocation => Intl.message(
    'Your current location',
    name: 'yourCurrentLocation',
    desc: 'Translation for the word Your current location',
    locale: localeName,
  );
  String get chooseLocation => Intl.message(
    'Choose Location',
    name: 'chooseLocation',
    desc: 'Translation for the word Choose Location',
    locale: localeName,
  );
  String get confirm => Intl.message(
    'Confirm',
    name: 'confirm',
    desc: 'Translation for the word Confirm',
    locale: localeName,
  );
  String get searchForPlace => Intl.message(
    'Search for place',
    name: 'searchForPlace',
    desc: 'Translation for the word Search for place',
    locale: localeName,
  );
  String get selectAddress => Intl.message(
    'Select Address',
    name: 'selectAddress',
    desc: 'Translation for the word Select Address',
    locale: localeName,
  );
  String get noAddress => Intl.message(
    'No Address',
    name: 'noAddress',
    desc: 'Translation for the word No Address',
    locale: localeName,
  );
  String get noAddressText => Intl.message(
    'You have not added any addresses yet, press the\nbutton and start add your addresses',
    name: 'noAddressText',
    desc: 'Translation for the word You have not added any addresses yet, press the\nbutton and start add your addresses',
    locale: localeName,
  );

  //
  String get typeOfPlace => Intl.message(
    'Type of place (work, home, etc.)',
    name: 'typeOfPlace',
    desc: 'Translation for the word Type of place (work, home, etc.)',
    locale: localeName,
  );
  String get addressTypeText => Intl.message(
    'This Address Type will appear on your account',
    name: 'addressTypeText',
    desc: 'Translation for the word This Address Type will appear on your account',
    locale: localeName,
  );
  String get region => Intl.message(
    'Region',
    name: 'region',
    desc: 'Translation for the word Region',
    locale: localeName,
  );
  String get pleaseChooseYourRegion => Intl.message(
    '* please choose your region',
    name: 'pleaseChooseYourRegion',
    desc: 'Translation for the word * please choose your region',
    locale: localeName,
  );

  String get city => Intl.message(
    'City',
    name: 'city',
    desc: 'Translation for the word City',
    locale: localeName,
  );

  String get pleaseChooseYourState => Intl.message(
    '* please choose your state',
    name: 'pleaseChooseYourState',
    desc: 'Translation for the word * please choose your state',
    locale: localeName,
  );

  String get streetName => Intl.message(
    'Street',
    name: 'streetName',
    desc: 'Translation for the word Street',
    locale: localeName,
  );
  String get buildingNumber => Intl.message(
    'Building number',
    name: 'buildingNumber',
    desc: 'Translation for the word Building number',
    locale: localeName,
  );

  String get placeNearYou => Intl.message(
    'Landmark (optional)',
    name: 'placeNearYou',
    desc: 'Translation for the word Landmark (optional)',
    locale: localeName,
  );

  String get phoneNumber => Intl.message(
    'Phone number',
    name: 'phoneNumber',
    desc: 'Translation for the word Phone number',
    locale: localeName,
  );
  String get phoneNumber2 => Intl.message(
    'Phone number 2 (optional)',
    name: 'phoneNumber2',
    desc: 'Translation for the word Phone number 2 (optional)',
    locale: localeName,
  );
  String get addAddress => Intl.message(
    'Add Address',
    name: 'addAddress',
    desc: 'Translation for the word Add Address',
    locale: localeName,
  );
  //
  String get yourGift => Intl.message(
    'Your Gift',
    name: 'yourGift',
    desc: 'Translation for the word Your Gift',
    locale: localeName,
  );

  //
  String get shippingPolicy => Intl.message(
    'Shipping Policy',
    name: 'shippingPolicy',
    desc: 'Translation for the word Shipping Policy',
    locale: localeName,
  );
  // String get myPurchases => Intl.message(
  //   'My Purchases',
  //   name: 'myPurchases',
  //   desc: 'Translation for the word My Purchases',
  //   locale: localeName,
  // );
  String get myReservations => Intl.message(
    'My Reservations',
    name: 'myReservations',
    desc: 'Translation for the word My Reservations',
    locale: localeName,
  );
  String get bookingRequests => Intl.message(
    'Booking Requests',
    name: 'bookingRequests',
    desc: 'Translation for the word Booking Requests',
    locale: localeName,
  );
  String get membershipRequest => Intl.message(
    'Membership Request',
    name: 'membershipRequest',
    desc: 'Translation for the word Membership Request',
    locale: localeName,
  );
  String get shareWin => Intl.message(
    'Share & Win',
    name: 'shareWin',
    desc: 'Translation for the word Share & Win',
    locale: localeName,
  );
  String get contactUs => Intl.message(
    'Contact Us',
    name: 'contactUs',
    desc: 'Translation for the word Contact Us',
    locale: localeName,
  );
  String get aboutUs => Intl.message(
    'About Us',
    name: 'aboutUs',
    desc: 'Translation for the word About Us',
    locale: localeName,
  );
  String get termsAndConditions => Intl.message(
    'Terms & Conditions',
    name: 'termsAndConditions',
    desc: 'Translation for the word Terms & Conditions',
    locale: localeName,
  );
  String get ourPolicy => Intl.message(
    'Our Policy',
    name: 'ourPolicy',
    desc: 'Translation for the word Our Policy',
    locale: localeName,
  );
  String get exchangeAndReturnPolicy => Intl.message(
    'Exchange and Return Policy',
    name: 'exchangeAndReturnPolicy',
    desc: 'Translation for the word Exchange and Return Policy',
    locale: localeName,
  );
  //
  String get youWillBeDeducted => Intl.message(
    'A total of',
    name: 'youWillBeDeducted',
    desc: 'Translation for the word A total of',
    locale: localeName,
  );
  String get youWillPay => Intl.message(
    'You will pay additional',
    name: 'youWillPay',
    desc: 'Translation for the word You will pay additional',
    locale: localeName,
  );
  String get cashOnDeliveryText => Intl.message(
    'You will pay the money upon receipt',
    name: 'cashOnDeliveryText',
    desc: 'Translation for the word You will pay the money upon receipt',
    locale: localeName,
  );
  String get sarFromYourBalance => Intl.message(
    'SAR will be\ndeducted from your balance',
    name: 'sarFromYourBalance',
    desc: 'Translation for the word SAR will be\ndeducted from your balance',
    locale: localeName,
  );
  String get sarFromCash => Intl.message(
    'SAR because of the delivery',
    name: 'sarFromCash',
    desc: 'Translation for the word because of the delivery',
    locale: localeName,
  );
  String get payWithTheBalance => Intl.message(
    'Wallet',
    name: 'payWithTheBalance',
    desc: 'Translation for the word Wallet',
    locale: localeName,
  );

  String get ePayment => Intl.message(
    'E-Payment',
    name: 'ePayment',
    desc: 'Translation for the word E-Payment',
    locale: localeName,
  );
  String get paymentMethod => Intl.message(
    'Payment Method',
    name: 'paymentMethod',
    desc: 'Translation for the word Payment Method',
    locale: localeName,
  );
  String get cashOnDelivery => Intl.message(
    'Cash on Delivery',
    name: 'cashOnDelivery',
    desc: 'Translation for the word Cash on Delivery',
    locale: localeName,
  );
  String get continueWord => Intl.message(
    'Continue',
    name: 'continueWord',
    desc: 'Translation for the word Continue',
    locale: localeName,
  );
  String get myWallet => Intl.message(
    'My Wallet',
    name: 'myWallet',
    desc: 'Translation for the word My Wallet',
    locale: localeName,
  );
  String get myWallet1 => Intl.message(
    'Wallet',
    name: 'myWallet1',
    desc: 'Translation for the word Wallet',
    locale: localeName,
  );
  String get prescriptionsMedicalReports => Intl.message(
    'Prescriptions & Medical Reports',
    name: 'prescriptionsMedicalReports',
    desc: 'Translation for the word Prescriptions & Medical Reports',
    locale: localeName,
  );
  String get mySchedule => Intl.message(
    'My Schedule',
    name: 'mySchedule',
    desc: 'Translation for the word My Schedule',
    locale: localeName,
  );
  // String get confirm => Intl.message(
  //   'Confirm',
  //   name: 'confirm',
  //   desc: 'Translation for the word Confirm',
  //   locale: localeName,
  // );





  //
  String get items => Intl.message(
    'items',
    name: 'items',
    desc: 'Translation for the word items',
    locale: localeName,
  );
  String get cardholderName => Intl.message(
    'Cardholder name',
    name: 'cardholderName',
    desc: 'Translation for the word Cardholder name',
    locale: localeName,
  );
  String get theNameWrittenOnTheCard => Intl.message(
    'The name written on the card',
    name: 'theNameWrittenOnTheCard',
    desc: 'Translation for the word The name written on the card',
    locale: localeName,
  );
  String get cardNumber => Intl.message(
    'Card number',
    name: 'cardNumber',
    desc: 'Translation for the word Card number',
    locale: localeName,
  );
  String get cardNumberText => Intl.message(
    'The 14-digit number written on the card',
    name: 'cardNumberText',
    desc: 'Translation for the word The 14-digit number written on the card',
    locale: localeName,
  );
  String get expiryDate => Intl.message(
    'Expiry date',
    name: 'expiryDate',
    desc: 'Translation for the word Expiry date',
    locale: localeName,
  );
  String get cardExpiryDate => Intl.message(
    'Card Expiry Date',
    name: 'cardExpiryDate',
    desc: 'Translation for the word Card Expiry Date',
    locale: localeName,
  );
  String get numbersOnTheBack => Intl.message(
    '3 numbers on the back',
    name: 'numbersOnTheBack',
    desc: 'Translation for the word 3 numbers on the back',
    locale: localeName,
  );
  String get cVV => Intl.message(
    'CVV',
    name: 'cVV',
    desc: 'Translation for the word CVV',
    locale: localeName,
  ); String get payNow => Intl.message(
    'Pay Now',
    name: 'payNow',
    desc: 'Translation for the word Pay Now',
    locale: localeName,
  );
  // String get confirm => Intl.message(
  //   'Confirm',
  //   name: 'confirm',
  //   desc: 'Translation for the word Confirm',
  //   locale: localeName,
  // );
  String get paymentData => Intl.message(
    'Payment Data',
    name: 'paymentData',
    desc: 'Translation for the word Payment Data',
    locale: localeName,
  );

  String get proceedToCheckout => Intl.message(
    'Proceed to Checkout ',
    name: 'proceedToCheckout',
    desc: 'Translation for the word Proceed to Checkout ',
    locale: localeName,
  );
  String get emailValidate2 => Intl.message(
    'Email user must contain 3 letters at least',
    name: 'emailValidate2',
    desc: 'Translation for the word Email user must contain 3 letters at least',
    locale: localeName,
  );
  // String get email => Intl.message(
  //         'Email',
  //         name: 'email',
  //         desc: 'Translation for the word Email',
  //         locale: localeName,
  //       );
  String get recommendedBy => Intl.message(
    'RECOMMENDED BY',
    name: 'recommendedBy',
    desc: 'Translation for the word RECOMMENDED BY',
    locale: localeName,
  );
  String get seller => Intl.message(
    'Seller',
    name: 'seller',
    desc: 'Translation for the word Seller',
    locale: localeName,
  );
  String get change => Intl.message(
    'Change',
    name: 'change',
    desc: 'Translation for the word Change',
    locale: localeName,
  );
  String get cart => Intl.message(
    'Cart',
    name: 'cart',
    desc: 'Translation for the word Cart',
    locale: localeName,
  );
  String get wishlist1 => Intl.message(
    'Wishlist',
    name: 'wishlist1',
    desc: 'Translation for the word Wishlist',
    locale: localeName,
  );
  // String get sar => Intl.message(
  //   'SAR',
  //   name: 'sar',
  //   desc: 'Translation for the word SAR',
  //   locale: localeName,
  // );
  String get totalBalance => Intl.message(
    'Total Balance',
    name: 'totalBalance',
    desc: 'Translation for the word Total Balance',
    locale: localeName,
  );
  String get recharge => Intl.message(
    'Recharge',
    name: 'recharge',
    desc: 'Translation for the word Recharge',
    locale: localeName,
  );
  String get transfer => Intl.message(
    'Transfer',
    name: 'transfer',
    desc: 'Translation for the word Transfer',
    locale: localeName,
  );
  String get summary => Intl.message(
    'Summary',
    name: 'summary',
    desc: 'Translation for the word Summary',
    locale: localeName,
  );
  // String get notifications => Intl.message(
  //   'الإشعارات',
  //   name: 'notifications',
  //   desc: 'Translation for the word الإشعارات',
  //   locale: localeName,
  // );
  ///
  String get store => Intl.message(
    'Store',
    name: 'store',
    desc: 'Translation for the word Store',
    locale: localeName,
  );
  String get purchases => Intl.message(
    'Purchases',
    name: 'purchases',
    desc: 'Translation for the word Purchases',
    locale: localeName,
  );
  String get more => Intl.message(
    'More',
    name: 'more',
    desc: 'Translation for the word More',
    locale: localeName,
  );
  String get noResultsFound => Intl.message(
    'No results found',
    name: 'noResultsFound',
    desc: 'Translation for the word No results found',
    locale: localeName,
  );
  String get home => Intl.message(
    'Home',
    name: 'home',
    desc: 'Translation for the word Home',
    locale: localeName,
  );
  String get requests => Intl.message(
    'Requests',
    name: 'requests',
    desc: 'Translation for the word Requests',
    locale: localeName,
  );
  String get wishlist => Intl.message(
    'Wishlist',
    name: 'wishlist',
    desc: 'Translation for the word Wishlist',
    locale: localeName,
  );
  String get profile => Intl.message(
    'Profile',
    name: 'profile',
    desc: 'Translation for the word Profile',
    locale: localeName,
  );
  ///
  String get phoneValidate2 => Intl.message(
    'Phone number must contain digits only',
    name: 'phoneValidate2',
    desc: 'Translation for the word Phone number must contain digits only',
    locale: localeName,
  );
  String get phoneValidate3 => Intl.message(
    'Please enter a correct number',
    name: 'phoneValidate3',
    desc: 'Translation for the word Please enter a correct number',
    locale: localeName,
  );
  // String get change => Intl.message(
  //   'Change',
  //   name: 'change',
  //   desc: 'Translation for the word Change',
  //   locale: localeName,
  // );
  String get activate => Intl.message(
    'Activate',
    name: 'activate',
    desc: 'Translation for the word Activate',
    locale: localeName,
  );
  String get changeActivatePhone => Intl.message(
    'Change/Activate phone',
    name: 'changeActivatePhone',
    desc: 'Translation for the word Change/Activate phone',
    locale: localeName,
  );
  String get changeActivateEmail => Intl.message(
    'Change/Activate email',
    name: 'changeActivateEmail',
    desc: 'Translation for the word Change/Activate email',
    locale: localeName,
  );
  String get activatePhoneNumber => Intl.message(
    'Activate phone number',
    name: 'activatePhoneNumber',
    desc: 'Translation for the word Activate phone number',
    locale: localeName,
  );
  String get activateEmail => Intl.message(
    'Activate email',
    name: 'activateEmail',
    desc: 'Translation for the word Activate email',
    locale: localeName,
  );
  String get changePhoneNumber => Intl.message(
    'Change phone number',
    name: 'changePhoneNumber',
    desc: 'Translation for the word Change phone number',
    locale: localeName,
  );
  String get changeEmail => Intl.message(
    'Change email',
    name: 'changeEmail',
    desc: 'Translation for the word Change email',
    locale: localeName,
  );
  String get loginFailed => Intl.message(
    'Login failed',
    name: 'loginFailed',
    desc: 'Translation for the word Login failed',
    locale: localeName,
  );
  String get yourEmailIsNotActivated => Intl.message(
    'Your email is not activated\nDo you want to activate now ?',
    name: 'yourEmailIsNotActivated',
    desc: 'Translation for the word Your email is not activated\nDo you want to activate now ?',
    locale: localeName,
  );
  String get yourPhoneIsNotActivated => Intl.message(
    'Your phone is not activated\nDo you want to activate now ?',
    name: 'yourPhoneIsNotActivated',
    desc: 'Translation for the word Your phone is not activated\nDo you want to activate now ?',
    locale: localeName,
  );
  String get phoneValidate => Intl.message(
          'Please enter a valid phone number',
          name: 'phoneValidate',
          desc: 'Translation for the word Please enter a valid phone number',
          locale: localeName,
        );
  String get emailOrPhoneValidate => Intl.message(
          'Please enter email or phone number',
          name: 'emailOrPhoneValidate',
          desc: 'Translation for the word Please enter email or phone number',
          locale: localeName,
        );
  // String get noResultsFound => Intl.message(
  //   'No results found',
  //   name: 'noResultsFound',
  //   desc: 'Translation for the word No results found',
  //   locale: localeName,
  // );
  // String get home => Intl.message(
  //   'Home',
  //   name: 'home',
  //   desc: 'Translation for the word Home',
  //   locale: localeName,
  // );
  // String get requests => Intl.message(
  //   'Requests',
  //   name: 'requests',
  //   desc: 'Translation for the word Requests',
  //   locale: localeName,
  // );
  String get favorite => Intl.message(
    'Favorite',
    name: 'favorite',
    desc: 'Translation for the word Favorite',
    locale: localeName,
  );
  // String get profile => Intl.message(
  //   'Profile',
  //   name: 'profile',
  //   desc: 'Translation for the word Profile',
  //   locale: localeName,
  // );
  ///
  String get noMoreCountries => Intl.message(
    'لا يوجد نتائج',
    name: 'noMoreCountries',
    desc: 'Translation for the word لا يوجد نتائج',
    locale: localeName,
  );
  String get noMoreResults => Intl.message(
    'No More Results',
    name: 'noMoreResults',
    desc: 'Translation for the word No More Results',
    locale: localeName,
  );
  String get privacyPolicy => Intl.message(
    'سياسة الخصوصية',
    name: 'privacyPolicy',
    desc: 'Translation for the word سياسة الخصوصية',
    locale: localeName,
  );


  String get gallery => Intl.message(
          'gallery',
          name: 'gallery',
          desc: 'Translation for the word معرض الصور',
          locale: localeName,
        );
  String get camera => Intl.message(
          'camera',
          name: 'camera',
          desc: 'Translation for the word الكاميرا',
          locale: localeName,
        );

  String get address => Intl.message(
          'address',
          name: 'address',
          desc: 'Translation for the word العنوان',
          locale: localeName,
        );
  String get phone => Intl.message(
          'Phone Number',
          name: 'phone',
          desc: 'Translation for the word Phone Number',
          locale: localeName,
        );
  String get playerPosition => Intl.message(
          'مركز اللاعب',
          name: 'playerPosition',
          desc: 'Translation for the word مركز اللاعب',
          locale: localeName,
        );
  String get country => Intl.message(
          'country',
          name: 'country',
          desc: 'Translation for the word الدولة',
          locale: localeName,
        );
  String get pleaseChoose => Intl.message(
          'من فضلك اختر',
          name: 'pleaseChoose',
          desc: 'Translation for the word من فضلك اختر',
          locale: localeName,
        );
  String get login1 => Intl.message(
    'Log In',
    name: 'login1',
    desc: 'Translation for the word Log In',
    locale: localeName,
  );
  String get login => Intl.message(
          'login',
          name: 'login',
          desc: 'Translation for the word login',
          locale: localeName,
        );
  // String get addAddress => Intl.message(
  //   'Add address',
  //   name: 'addAddress',
  //   desc: 'Translation for the word Add address',
  //   locale: localeName,
  // );
  String get addAddressText => Intl.message(
    'You must add an address first',
    name: 'addAddressText',
    desc: 'Translation for the word You must add an address first',
    locale: localeName,
  );
  String get confirmLogoutText => Intl.message(
    'Are you sure you want to logout ?',
    name: 'confirmLogoutText',
    desc: 'Translation for the word Are you sure you want to logout ?',
    locale: localeName,
  );
  String get logOut => Intl.message(
    'Logout',
    name: 'logOut',
    desc: 'Translation for the word Log out',
    locale: localeName,
  );
  String get loggedOutSuccessfully => Intl.message(
    'Logged out successfully',
    name: 'loggedOutSuccessfully',
    desc: 'Translation for the word logged out successfully',
    locale: localeName,
  );
  String get activationCodeIs => Intl.message(
          'كود التفعيل هو',
          name: 'activationCodeIs',
          desc: 'Translation for the word كود التفعيل هو',
          locale: localeName,
        );
  String get activation => Intl.message(
          'activation',
          name: 'activation',
          desc: 'Translation for the word Activation',
          locale: localeName,
        );
  String get emailValidate => Intl.message(
    ' Please enter a valid email',
    name: 'emailValidate',
    desc: 'Translation for the word Please enter a valid email',
    locale: localeName,
  );
  String get validateConfirmPassword => Intl.message(
    'Passwords don\'t match',
    name: 'validateConfirmPassword',
    desc: 'Translation for the word Passwords d',
    locale: localeName,
  );
  String get validatePassword => Intl.message(
    'Password must contain 8 characters at least',
    name: 'validatePassword',
    desc: 'Translation for the word Password must contain 6 characters at least',
    locale: localeName,
  );
  String get name => Intl.message(
    'name',
    name: 'name',
    desc: 'Translation for the word Name',
    locale: localeName,
  );
  String get pleaseEnter => Intl.message(
    'Please enter',
    name: 'pleaseEnter',
    desc: 'Translation for the word Please enter',
    locale: localeName,
  );

  String get pleaseLoginFirst => Intl.message(
    'Please login first',
    name: 'pleaseLoginFirst',
    desc: 'Translation for the word Please login first',
    locale: localeName,
  );

  String get notifications => Intl.message(
    'Notifications',
    name: 'notifications',
    desc: 'Translation for the word الإشعارات',
    locale: localeName,
  );
  // String get more => Intl.message(
  //   'more',
  //   name: 'more',
  //   desc: 'Translation for the word المزيد',
  //   locale: localeName,
  // );

  String get next => Intl.message(
          'next',
          name: 'next',
          desc: 'Translation for the word التالي',
          locale: localeName,
        );
  String get chooseYourPreferredLanguage => Intl.message(
          'اختر اللغة المفضلة للتطبيق',
          name: 'chooseYourPreferredLanguage',
          desc: 'Translation for the word اختر اللغة المفضلة للتطبيق',
          locale: localeName,
        );
  String get language => Intl.message(
          'language',
          name: 'language',
          desc: 'Translation for the word اللغة',
          locale: localeName,
        );
  String get done => Intl.message(
          'done',
          name: 'done',
          desc: 'Translation for the word تم',
          locale: localeName,
        );
  String get cancel => Intl.message(
          'Cancel',
          name: 'cancel',
          desc: 'Translation for the word Cancel',
          locale: localeName,
        );
  String get ok => Intl.message(
          'Ok',
          name: 'ok',
          desc: 'Translation for the word Ok',
          locale: localeName,
        );
  // String get loginText1 => Intl.message(
  //   'Not Logged In',
  //   name: 'loginText1',
  //   desc: 'Translation for the word Not Logged In',
  //   locale: localeName,
  // );
  String get loginText2 => Intl.message(
    'please Log in first',
    name: 'loginText2',
    desc: 'Translation for the word please Log in first',
    locale: localeName,
  );

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
