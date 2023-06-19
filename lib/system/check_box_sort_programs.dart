class CheckBoxSortPrograms {
  String title;
  bool isCheck;

  CheckBoxSortPrograms({
    required this.title,
    required this.isCheck,
  });

  static List<CheckBoxSortPrograms> getList() {
    return <CheckBoxSortPrograms>[
      CheckBoxSortPrograms(
        title: 'ذهاب فقط',
        isCheck: true,
      ),
      CheckBoxSortPrograms(
        title: 'ذهاب وعودة',
        isCheck: false,
      ),
    ];
  }
}
