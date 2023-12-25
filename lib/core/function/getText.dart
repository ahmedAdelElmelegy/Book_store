import 'package:book_app/features/home/data/models/book_model/book_model.dart';

gettext(BookModel books) {
  if (books.volumeInfo.previewLink == null) {
    return 'Not Avaliable';
  } else {
    return 'Preview';
  }
}
