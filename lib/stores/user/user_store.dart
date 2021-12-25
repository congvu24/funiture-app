import 'package:boilerplate/models/product/Product.model.dart';
import 'package:boilerplate/models/profile/profile.model.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../form/form_store.dart';

part 'user_store.g.dart';

Profile defaultProfile = new Profile(name: "Công Vũ", phone: "0349424977", address: "Gò Vấp, TP.HCM", email: "1", username: "1", password: "1");

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<bool> emptyLoginResponse = ObservableFuture.value(false);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  ObservableFuture<bool> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

  @observable
  ObservableList<Product> wishlist = new ObservableList<Product>();

  @observable
  Profile profile = defaultProfile;

  // actions:-------------------------------------------------------------------
  @action
  Future<bool> login(String email, String password) async {
    print(email);
    print(password);
    print(defaultProfile.email);
    print(defaultProfile.password);
    if (email == defaultProfile.email && password == defaultProfile.password) {
      _repository.saveIsLoggedIn(true);
      this.isLoggedIn = true;
      this.success = true;
      return true;
    } else
      return false;
  }

  logout() {
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
  }

  addWishlist(Product product) {
    if (wishlist.indexWhere((element) => product.id == element.id) == -1) wishlist.add(product);
  }

  removeFromWishlist(Product product) {
    wishlist.removeWhere((element) => product.id == element.id);
  }

  bool checkInWishlist(Product product) {
    return wishlist.indexWhere((element) => product.id == element.id) >= 0;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
