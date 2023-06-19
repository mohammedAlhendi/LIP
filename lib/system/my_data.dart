class MyData {
  String? dateTime1;
  String? dateTime2;
  String? dateTime3;
  String? dateTime4;
  String? dateTime5;
  String? d1;
  String? d2;
  String? d3;
  String? d4;
  String? d5;
  String? d6;
  String? d7;
  String? d8;
  String? d9;
  String? d10;
  String? d11;
  String? d12;
  String? d13;
  String? d14;
  String? d15;
  String? d16;
  String? d17;
  String? d18;
  String? d19;
  String? d20;
  String? d21;
  String? d22;
  String? d23;
  String? d24;
  String? d25;

  MyData(
      {this.dateTime1,
      this.dateTime2,
      this.dateTime3,
      this.dateTime4,
      this.dateTime5,
      this.d1,
      this.d2,
      this.d3,
      this.d4,
      this.d5,
      this.d6,
      this.d7,
      this.d8,
      this.d9,
      this.d10,
      this.d11,
      this.d12,
      this.d13,
      this.d14,
      this.d15,
      this.d16,
      this.d17,
      this.d18,
      this.d19,
      this.d20,
      this.d21,
      this.d22,
      this.d23,
      this.d24,
      this.d25});

  MyData.fromJson(Map<String, dynamic> json) {
    dateTime1 = json['DateTime1'];
    dateTime2 = json['DateTime2'];
    dateTime3 = json['DateTime3'];
    dateTime4 = json['DateTime4'];
    dateTime5 = json['DateTime5'];
    d1 = json['D1'];
    d2 = json['D2'];
    d3 = json['D3'];
    d4 = json['D4'];
    d5 = json['D5'];
    d6 = json['D6'];
    d7 = json['D7'];
    d8 = json['D8'];
    d9 = json['D9'];
    d10 = json['D10'];
    d11 = json['D11'];
    d12 = json['D12'];
    d13 = json['D13'];
    d14 = json['D14'];
    d15 = json['D15'];
    d16 = json['D16'];
    d17 = json['D17'];
    d18 = json['D18'];
    d19 = json['D19'];
    d20 = json['D20'];
    d21 = json['D21'];
    d22 = json['D22'];
    d23 = json['D23'];
    d24 = json['D24'];
    d25 = json['D25'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DateTime1'] = dateTime1;
    data['DateTime2'] = dateTime2;
    data['DateTime3'] = dateTime3;
    data['DateTime4'] = dateTime4;
    data['DateTime5'] = dateTime5;
    data['D1'] = d1;
    data['D2'] = d2;
    data['D3'] = d3;
    data['D4'] = d4;
    data['D5'] = d5;
    data['D6'] = d6;
    data['D7'] = d7;
    data['D8'] = d8;
    data['D9'] = d9;
    data['D10'] = d10;
    data['D11'] = d11;
    data['D12'] = d12;
    data['D13'] = d13;
    data['D14'] = d14;
    data['D15'] = d15;
    data['D16'] = d16;
    data['D17'] = d17;
    data['D18'] = d18;
    data['D19'] = d19;
    data['D20'] = d20;
    data['D21'] = d21;
    data['D22'] = d22;
    data['D23'] = d23;
    data['D24'] = d24;
    data['D25'] = d25;
    return data;
  }
}
