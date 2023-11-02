import 'package:flutter/cupertino.dart';
import 'package:go_list/model/shopping_list.dart';
import 'package:go_list/model/shopping_list_collection.dart';
import 'package:go_list/service/storage/local_settings_storage.dart';
import 'package:go_list/service/storage/shopping_list_storage.dart';

class GlobalAppState extends ChangeNotifier {
  late ShoppingListCollection shoppingLists;
  late String selectedShoppingListId;
  late List<String>? shoppingListOrder;
  Function? connectionFailureCallback;

  GlobalAppState() {
    shoppingListOrder = LocalSettingsStorage().loadShoppingListOrder();
    setShoppingLists(ShoppingListStorage().loadShoppingListsFromLocalStorage());
    if (shoppingLists.length() == 0) {
      upsertShoppingList(ShoppingList(name: "Einkaufsliste")); // TODO
    }
    selectedShoppingListId =
        LocalSettingsStorage().loadSelectedShoppingListId() ??
            shoppingLists.first()!.id;
  }

  Future<void> loadListsFromStorageInBackground() async {
    return ShoppingListStorage().loadShoppingLists().listen(setShoppingLists).asFuture();
  }

  Future<void> loadListsFromRemoteStorage() async {
    setShoppingLists(await ShoppingListStorage().loadShoppingLists().last);
  }

  setShoppingLists(ShoppingListCollection shoppingLists) {
    this.shoppingLists = shoppingLists;
    if (shoppingListOrder != null) {
      this.shoppingLists.setOrder(shoppingListOrder!);
    }
    notifyListeners();
  }

  setShoppingListOrder(List<String> shoppingListOrder) {
    shoppingLists.setOrder(shoppingListOrder);
    LocalSettingsStorage().saveShoppingListOrder(shoppingListOrder);
    notifyListeners();
  }

  getSelectedShoppingList() {
    return shoppingLists.entryWithId(selectedShoppingListId);
  }

  void setSelectedShoppingListId(String selectedShoppingListId) {
    this.selectedShoppingListId = selectedShoppingListId;
    notifyListeners();
  }

  void deleteShoppingList(ShoppingList shoppingList) {
    shoppingList.deleted = true;
    upsertShoppingList(shoppingList);
  }

  void upsertShoppingList(ShoppingList shoppingList) {
    shoppingLists.upsert(shoppingList);
    ShoppingListStorage().upsertShoppingList(shoppingList);
    setSelectedShoppingListId(shoppingList.id);
    notifyListeners();
  }

  void updateListOrder(int oldIndex, int newIndex) {
    shoppingLists.moveListInOrder(oldIndex, newIndex);
    LocalSettingsStorage().saveShoppingListOrder(shoppingLists.order);
    notifyListeners();
  }
}
