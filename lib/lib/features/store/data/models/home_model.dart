import 'package:equatable/equatable.dart';
import 'package:round/features/store/data/models/sub_models/contact_options.dart';
import 'package:round/features/store/data/models/sub_models/default_address_model.dart';
import 'package:round/features/store/data/models/sub_models/slide.dart';
import 'package:round/features/store/data/models/sub_models/store_categories.dart';

class MainHomeModel extends Equatable {
  List<ContactOptionsModel>? contactOptions;
  List<SlideModel>? slides;
  List<StoreCategoriesModel>? storeCategories;
  List<DefaultAddressModel> defaultAddresses = [];
  int? cartCount;
  MainHomeModel(this.contactOptions, this.slides, this.storeCategories,
      this.defaultAddresses, this.cartCount);

  MainHomeModel.fromJson(Map<String, dynamic> json) {
    cartCount = json['cart_count'];

    if (json['contact_options'] != null) {
      contactOptions = [];
      json['contact_options'].forEach((v) {
        contactOptions!.add(new ContactOptionsModel.fromJson(v));
      });
    }
    if (json['slider'] != null) {
      slides = [];
      json['slider'].forEach((v) {
        slides!.add(new SlideModel.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      storeCategories = [];
      json['categories'].forEach((v) {
        storeCategories!.add(new StoreCategoriesModel.fromJson(v));
      });
    }
    if (json['defaultAddress'] != null) {
      json['defaultAddress'].forEach((v) {
        defaultAddresses.add(new DefaultAddressModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_count'] = this.cartCount;

    data['defaultAddresses'] =
        this.defaultAddresses.map((v) => v.toJson()).toList();
    if (this.storeCategories != null) {
      data['categories'] =
          this.storeCategories!.map((v) => v.toJson()).toList();
    }
    if (this.slides != null) {
      data['slider'] = this.slides!.map((v) => v.toJson()).toList();
    }
    if (this.contactOptions != null) {
      data['contact_options'] =
          this.contactOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [slides, contactOptions, defaultAddresses, storeCategories];
}
