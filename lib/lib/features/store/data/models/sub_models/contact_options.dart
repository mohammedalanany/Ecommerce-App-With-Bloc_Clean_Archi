class ContactOptionsModel {
  String? optionName;
  String? name;
  String? value;

  ContactOptionsModel({this.optionName, this.name, this.value});

  ContactOptionsModel.fromJson(Map<String, dynamic> json) {
    optionName = json['option_name'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_name'] = this.optionName;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
