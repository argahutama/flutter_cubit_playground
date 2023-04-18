class CatFacts {
  int currentPage = 0;
  int total = 0;
  String? nextPageUrl;
  String? prevPageUrl;
  List<String> data = [];

  CatFacts({
    required this.currentPage,
    required this.total,
    required this.nextPageUrl,
    required this.prevPageUrl,
    required this.data,
  });
}
