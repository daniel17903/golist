import 'package:flutter/cupertino.dart';
import 'package:go_list/model/collections/shopping_list_collection.dart';
import 'package:go_list/model/item.dart';
import 'package:go_list/model/settings.dart';
import 'package:go_list/model/shopping_list.dart';
import 'package:go_list/service/golist_client.dart';
import 'package:go_list/service/golist_languages.dart';
import 'package:go_list/service/items/input_to_item_parser.dart';
import 'package:go_list/service/storage/provider/local_storage_provider.dart';
import 'package:go_list/service/storage/provider/remote_storage_provider.dart';
import 'package:go_list/service/storage/shopping_list_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlobalAppState extends ChangeNotifier {
  final GoListClient goListClient;
  late final ShoppingListStorage shoppingListStorage;
  late ShoppingListCollection shoppingLists;
  late Settings settings;
  Function? connectionFailureCallback;

  GlobalAppState(
      {required this.goListClient,
      required LocalStorageProvider localStorageProvider,
      required RemoteStorageProvider remoteStorageProvider}) {
    shoppingListStorage =
        ShoppingListStorage(localStorageProvider, remoteStorageProvider);
    shoppingLists = shoppingListStorage.loadShoppingListsFromLocalStorage();

    // load settings or create default
    Settings? settingsFromStorage = shoppingListStorage.loadSettings();
    if (settingsFromStorage == null ||
        !shoppingLists
            .containsEntryWithId(settingsFromStorage.selectedShoppingListId)) {
      settings = Settings(
          selectedShoppingListId: shoppingLists.first()?.id ?? "",
          shoppingListOrder: shoppingLists.order);
      shoppingListStorage.saveSettings(settings);
    } else {
      settings = settingsFromStorage;
    }

    shoppingLists.setOrder(settings.shoppingListOrder);
    goListClient.deviceId = settings.deviceId;
    InputToItemParser().init(languageCode);
    _initWithDefaultListIfEmpty();
    _listenForChangesInSelectedShoppingList();
    notifyListeners();
  }

  ShoppingList? _initWithDefaultListIfEmpty() {
    if (shoppingLists.length == 0) {
      ShoppingList defaultList = ShoppingList(name: "");
      shoppingLists.upsert(defaultList);
      shoppingListStorage.upsertShoppingList(defaultList);
      settings.selectedShoppingListId = defaultList.id;
      shoppingListStorage.saveSettings(settings);
      AppLocalizations.delegate.load(settings.locale).then((appLocalizations) {
        defaultList.name = appLocalizations.default_name;
        shoppingListStorage.upsertShoppingList(defaultList);
      });
      return defaultList;
    }
    return null;
  }

  Future<void> loadListsFromStorage() async {
    await shoppingListStorage
        .loadShoppingLists()
        .listen(setShoppingLists)
        .asFuture()
        .onError((e, s) {
      if (connectionFailureCallback != null) {
        connectionFailureCallback!();
      }
    });
  }

  registerConnectionFailureCallback(Function connectionFailureCallback) {
    this.connectionFailureCallback = connectionFailureCallback;
  }

  setShoppingLists(ShoppingListCollection shoppingLists) {
    if (!this.shoppingLists.equals(shoppingLists)) {
      this.shoppingLists = shoppingLists;
      this.shoppingLists.setOrder(settings.shoppingListOrder);
      notifyListeners();
    }
  }

  setShoppingListOrder(List<String> shoppingListOrder) {
    shoppingLists.setOrder(shoppingListOrder);
    settings.shoppingListOrder = shoppingListOrder;
    shoppingListStorage.saveSettings(settings);
    notifyListeners();
  }

  void setSelectedShoppingListId(String selectedShoppingListId) {
    settings.selectedShoppingListId = selectedShoppingListId;
    shoppingListStorage.saveSettings(settings);
    notifyListeners();
    _listenForChangesInSelectedShoppingList();
  }

  void _listenForChangesInSelectedShoppingList() {
    shoppingListStorage
        .listenForChanges(settings.selectedShoppingListId)
        .listen((shoppingList) {
          print(settings.selectedShoppingListId);
          print(shoppingLists.map((s) => s.id));
      shoppingLists.upsert(shoppingList);
          print(shoppingLists.map((s) => s.id));
      notifyListeners();
    });
  }

  void deleteShoppingList(String shoppingListId) {
    shoppingLists.removeEntryWithId(shoppingListId);
    _initWithDefaultListIfEmpty();
    // if selected list was deleted select the first list
    if (settings.selectedShoppingListId == shoppingListId) {
      settings.selectedShoppingListId = shoppingLists.first()!.id;
      shoppingListStorage.saveSettings(settings);
    }
    shoppingListStorage.deleteShoppingList(shoppingListId);
    notifyListeners();
  }

  void upsertShoppingList(ShoppingList shoppingList) {
    shoppingLists.upsert(shoppingList);
    shoppingListStorage.upsertShoppingList(shoppingList);
    setSelectedShoppingListId(shoppingList.id);
    notifyListeners();
  }

  void updateListOrder(int oldIndex, int newIndex) {
    shoppingLists.moveEntryInOrder(oldIndex, newIndex);
    settings.shoppingListOrder = shoppingLists.order;
    shoppingListStorage.saveSettings(settings);
    notifyListeners();
  }

  ShoppingList get selectedShoppingList =>
      shoppingLists.entryWithId(settings.selectedShoppingListId)!;

  void deleteItem(Item item) {
    item.deleted = true;
    shoppingListStorage.upsertShoppingList(selectedShoppingList);
    notifyListeners();
  }

  void upsertItem(Item item) {
    selectedShoppingList.upsertItem(item);
    shoppingListStorage.upsertShoppingList(selectedShoppingList);
    notifyListeners();
  }

  setLocale(Locale locale) {
    settings.language = locale.languageCode;
    shoppingListStorage.saveSettings(settings);
    InputToItemParser().init(languageCode);
    notifyListeners();
  }

  Locale get locale => Locale(languageCode);

  String get languageName => GoListLanguages.getLanguageName(settings.language);

  String get languageCode => settings.language;
}
