import 'package:flutter/material.dart';
import 'package:round/features/auth_feature/check_user/presentation/check-user_screen.dart';
import 'package:round/features/auth_feature/splash/pages/splash.dart';
import 'package:round/features/store/presentation/screens/product_detail_screen.dart';
import 'package:round/features/store/presentation/screens/store_home_screen.dart';
import 'package:round/src/screens/addresses/add_address_for_summary_screen.dart';
import 'package:round/src/screens/addresses/add_address_screen.dart';
import 'package:round/src/screens/addresses/edit_address_screen.dart';
import 'package:round/src/screens/addresses/location_screen.dart';
import 'package:round/src/screens/addresses/select_address_screen.dart';
import 'package:round/src/screens/auth/add_info_screen/add_info_screen.dart';
import 'package:round/src/screens/auth/change_pssword_screen/change_password_screen.dart';
import 'package:round/src/screens/auth/enter_password_screen/enter_password_screen.dart';
import 'package:round/src/screens/auth/login_screens/login_screen.dart';
import 'package:round/src/screens/auth/my_account_screen/my_account_screen.dart';
import 'package:round/src/screens/auth/reset_password_screens/reset_passward_screen.dart';
import 'package:round/src/screens/auth/reset_password_screens/reset_password_screen2.dart';
import 'package:round/src/screens/auth/store_setting_screen/store_setting_screen.dart';
import 'package:round/src/screens/auth/verfication_screens/verfication_screen.dart';
import 'package:round/src/screens/auth/verfication_screens/verify_email_screen.dart';
import 'package:round/src/screens/auth/verfication_screens/verify_mobile_number_Screen.dart';
import 'package:round/src/screens/global/about_screen.dart';
import 'package:round/src/screens/global/bill_url_screen.dart';
import 'package:round/src/screens/global/contact_us_screen.dart';
import 'package:round/src/screens/global/delivery_policy_screen.dart';
import 'package:round/src/screens/global/our_policy_screen.dart';
import 'package:round/src/screens/global/return_policy_screen.dart';
import 'package:round/src/screens/global/terms_screen.dart';
import 'package:round/src/screens/splash_screen.dart';
import 'package:round/src/screens/store/cart_screen.dart';
import 'package:round/src/screens/store/e_payment_webview_screen.dart';
import 'package:round/src/screens/store/images_screen.dart';
import 'package:round/src/screens/store/my_wallet_screen.dart';
import 'package:round/src/screens/store/online_payment_method_screen.dart';
import 'package:round/src/screens/store/payment_data_screen.dart';
import 'package:round/src/screens/store/payment_method.dart';
import 'package:round/src/screens/store/producr_rate_screen.dart';
import 'package:round/src/screens/store/product_information_store_screen.dart';
import 'package:round/src/screens/store/product_rating_screen.dart';
import 'package:round/src/screens/store/product_search_store_screen.dart';
import 'package:round/src/screens/store/recharge_screen.dart';
import 'package:round/src/screens/store/recommendation_screen.dart';
import 'package:round/src/screens/store/store_all_brands_screen.dart';
import 'package:round/src/screens/store/store_all_new_offers_screen.dart';
import 'package:round/src/screens/store/store_all_recommended_products_screen.dart';
import 'package:round/src/screens/store/store_category_products_screen.dart';
import 'package:round/src/screens/store/store_main_screen.dart';
import 'package:round/src/screens/store/store_more_screen.dart';
import 'package:round/src/screens/store/store_other_sellers.dart';
import 'package:round/src/screens/store/store_purchase_details.dart';
import 'package:round/src/screens/store/store_purchase_screen.dart';
import 'package:round/src/screens/store/store_screen.dart';
import 'package:round/src/screens/store/store_wishlist_screen.dart';
import 'package:round/src/screens/store/summary_screen.dart';
import 'package:round/src/screens/store/transfer_screen.dart';
import 'package:round/src/screens/unused_screen/clinics_screen.dart';
import 'package:round/src/screens/unused_screen/doctors_screen.dart';
import 'package:round/src/screens/unused_screen/home_screen.dart';

class AppRoutes {
  static const initialRoute = SplashScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashPage.routeName: (_) => SplashPage(),
    CheckUserScreen.routeName: (_) => CheckUserScreen(),
    ProductSearchStoreScreen.routeName: (_) => ProductSearchStoreScreen(),
    StoreHomeScreen.routeName: (_) => StoreHomeScreen(),
    EnterPasswordScreen.routeName: (_) => EnterPasswordScreen(),
    AddAddressScreen.routeName: (_) => AddAddressScreen(),
    SelectAddressScreen.routeName: (_) => SelectAddressScreen(),
    LoginScreen.routeName: (_) => LoginScreen(),
    AddInfoScreen.routeName: (_) => AddInfoScreen(),
    ResetPasswordScreen.routeName: (_) => ResetPasswordScreen(),
    PaymentDataScreen.routeName: (_) => PaymentDataScreen(),
    VerificationScreen.routeName: (_) => VerificationScreen(),
    PaymentMethodScreen.routeName: (_) => PaymentMethodScreen(),
    HomeScreen.routeName: (_) => HomeScreen(),
    StoreScreen.routeName: (_) => StoreScreen(),
    StoreCategoryProductsScreen.routeName: (_) => StoreCategoryProductsScreen(),
    CartScreen.routeName: (_) => CartScreen(),
    SummaryScreen.routeName: (_) => SummaryScreen(),
    RecommendationScreen.routeName: (_) => RecommendationScreen(),
    ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
    ClinicsScreen.routeName: (_) => ClinicsScreen(),
    DoctorsScreen.routeName: (_) => DoctorsScreen(),
    ProductInformationStoreScreen.routeName: (_) =>
        ProductInformationStoreScreen(),
    StorePurchaseScreen.routeName: (_) => StorePurchaseScreen(),
    StoreWishlistScreen.routeName: (_) => StoreWishlistScreen(),
    StoreMainScreen.routeName: (_) => StoreMainScreen(),
    StoreSettingScreen.routeName: (_) => StoreSettingScreen(),
    StoreMoreScreen.routeName: (_) => StoreMoreScreen(),
    ProductSearchStoreScreen.routeName: (_) => ProductSearchStoreScreen(),
    MyWalletScreen.routeName: (_) => MyWalletScreen(),
    RechargeScreen.routeName: (_) => RechargeScreen(),
    TransferScreen.routeName: (_) => TransferScreen(),
    ChangePasswordScreen.routeName: (_) => ChangePasswordScreen(),
    MyAccountScreen.routeName: (_) => MyAccountScreen(),
    VerifyEmailScreen.routeName: (_) => VerifyEmailScreen(),
    VerifyMobilNumberScreen.routeName: (_) => VerifyMobilNumberScreen(),
    ResetPasswordScreen2.routeName: (_) => ResetPasswordScreen2(),
    StoreAllBrandsScreen.routeName: (_) => StoreAllBrandsScreen(),
    StoreAllNewOffersScreen.routeName: (_) => StoreAllNewOffersScreen(),
    StoreAllRecommendedProductsScreen.routeName: (_) =>
        StoreAllRecommendedProductsScreen(),
    LocationScreen.routeName: (_) => LocationScreen(),
    EditAddressScreen.routeName: (_) => EditAddressScreen(),
    StoreOtherSellers.routeName: (_) => StoreOtherSellers(),
    ProductRatingScreen.routeName: (_) => ProductRatingScreen(),
    StorePurchaseDetails.routeName: (_) => StorePurchaseDetails(),
    ProductRateScreen.routeName: (_) => ProductRateScreen(),
    TermsScreen.routeName: (_) => TermsScreen(),
    AboutScreen.routeName: (_) => AboutScreen(),
    OurPolicyScreen.routeName: (_) => OurPolicyScreen(),
    DeliveryPolicyScreen.routeName: (_) => DeliveryPolicyScreen(),
    ReturnPolicyScreen.routeName: (_) => ReturnPolicyScreen(),
    ContactUsScreen.routeName: (_) => ContactUsScreen(),
    OnlinePaymentMethodScreen.routeName: (_) => OnlinePaymentMethodScreen(),
    EPaymentWebviewScreen.routeName: (_) => EPaymentWebviewScreen(),
    StorePhotoViewScreen.routeName: (_) => StorePhotoViewScreen(),
    BillUrlScreen.routeName: (_) => BillUrlScreen(),
    AddAddressForSummaryScreen.routeName: (_) => AddAddressForSummaryScreen(),
  };
}
