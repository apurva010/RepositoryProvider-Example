class ImageRepository {
  String imgUrl = "https://source.unsplash.com/random?sig=";

  String getImage(String id) {
    String src = imgUrl + id;
    return src;
  }
}
