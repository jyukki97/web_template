class Rent {
  Rent({
    required this.title,
    required this.thumbnail,
    required this.area,
    required this.baths,
    required this.beds,
    required this.price,
  });
  String thumbnail;
  String title;
  String price;
  int beds;
  int baths;
  int area;
}

List<Rent> rentSample = [
  Rent(title: "프리미엄급 풍경, 제주도 푸른바다와 한라산 사이의 전원주택", thumbnail: "assets/images/thumbnail_2.jpg", area: 47, baths: 2, beds: 3, price: "1,500"),
  Rent(title: "주방과 이어진 정원, 작지만 공간활용이 잘 된 집", thumbnail: "assets/images/thumbnail_3.jpg", area: 47, baths: 2, beds: 3, price: "2,500"),
  Rent(title: "감각적인 풀장과 단순함이 매력인 스페인의 주택", thumbnail: "assets/images/thumbnail_4.jpg", area: 57, baths: 2, beds: 3, price: "1,800"),
  Rent(title: "초록의 잔디지붕이 인상적인, 힐링을 위한 숲 속 별장", thumbnail: "assets/images/thumbnail_5.jpg", area: 47, baths: 2, beds: 3, price: "500"),
];