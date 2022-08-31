import 'package:go_list/service/items/category.dart';
import 'package:go_list/service/items/icon_mapping.dart';

const String defaultIconAsset = "default";
const Category defaultCategory = Category.other;

final List<IconMapping> iconMappings = [
  IconMapping(
      assetFileName: "apple",
      matchingNames: ["apfel", "äpfel", "aepfel", "obst"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "banana",
      matchingNames: ["banane"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "bottle",
      matchingNames: [
        "flasche",
        "getränke"
            "wasser",
        "sprudel",
        "bier",
        "wein",
        "cola",
        "fanta",
        "limo",
        "limonade",
        "sprite",
        "apfelschorle",
        "pils",
        "hefeweizen",
        "red bull"
      ],
      category: Category.beverages),
  IconMapping(
      assetFileName: "bottle",
      matchingNames: [
        "öl",
        "oel",
        "essig",
        "sojasoße",
        "sojasosse",
        "soja sosse",
        "soja soße",
        "nayonnaise",
        "mayo",
        "ketchup",
        "remoulade"
      ],
      category: Category.convenienceProductFrozen),
  IconMapping(
      assetFileName: "box",
      matchingNames: [
        "box",
        "spülmaschinen tabs",
        "spülmaschinen-tabs",
        "spülmaschinen salz",
        "spülmaschinen-salz",
        "müsli",
        "muesli",
        "tempos",
        "taschentücher",
        "kaugummi",
        "geschirrspültaps",
        "speisestärke",
        "kakao",
        "kakaopulver",
        "zwieback"
      ],
      category: Category.household),
  IconMapping(
      assetFileName: "flour",
      matchingNames: ["mehl"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "bread",
      matchingNames: [
        "brot",
        "brötchen",
        "laugenstange",
        "brezel",
        "semmel",
        "baguette"
      ],
      category: Category.bread),
  IconMapping(
      assetFileName: "can",
      matchingNames: [
        "bohnen",
        "dose",
        "kichererbsen",
        "dosentomaten",
        "tomatendose"
      ],
      category: Category.spicesCanned),
  IconMapping(
      assetFileName: "carrot",
      matchingNames: [
        "karotte",
        "pastinake",
        "rübe",
        "ruebe",
        "rettich",
        "möhre",
        "gemüse",
        "gemuese"
      ],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "corn",
      matchingNames: [
        "samen",
        "körner",
        "linsen",
        "erbsen",
        "hirse",
        "haferflocken",
        "quinoa",
        "bulgur"
      ],
      category: Category.cereals),
  IconMapping(
      assetFileName: "cup",
      matchingNames: [
        "becher",
        "yoghurt",
        "joghurt",
        "quark",
        "saure sahne",
        "schlagsahne",
        "sahne",
        "pudding"
      ],
      category: Category.milkCheese),
  IconMapping(
      assetFileName: "glas",
      matchingNames: [
        "glas",
        "marmelade",
        "gläser",
        "honig",
        "aufstrich",
        "sauerkraut",
        "schattenmorellen",
        "nutella",
        "hummus",
        "guacamole",
        "senf",
        "pesto",
        "tahini"
      ],
      category: Category.spicesCanned),
  IconMapping(
      assetFileName: "leek",
      matchingNames: ["lauch", "porree"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "peanut",
      matchingNames: ["nuss", "nüsse", "cashews", "cashewkerne"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "almonds",
      matchingNames: ["mandel"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "round_fruit",
      matchingNames: [
        "tomate",
        "orange",
        "mandarine",
        "mango",
        "nektarine",
        "pfirsich"
      ],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "dead_cow",
      matchingNames: ["fleisch", "hackfleisch", "steak", "rinder"],
      category: Category.meatFish),
  IconMapping(
      assetFileName: "dead_pig",
      matchingNames: [
        "wurst",
        "schinken",
        "speck",
        "bacon",
        "würstchen",
        "würste",
        "fleischkäs",
        "leberkäs",
        "salami",
        "lyoner",
        "wiener",
        "aufschnitt",
        "schweine"
      ],
      category: Category.meatFish),
  IconMapping(
      assetFileName: "dead_chicken",
      matchingNames: ["hühnchen", "pute", "chicken", "hühner"],
      category: Category.meatFish),
  IconMapping(
      assetFileName: "fish",
      matchingNames: [
        "fisch",
        "lachs",
        "forelle",
        "barsch",
        "hecht",
        "dorade",
        "hering",
        "kabeljau",
        "dorsch",
        "karpfen",
        "fischstäbchen"
      ],
      category: Category.meatFish),
  IconMapping(
      assetFileName: "cookie",
      matchingNames: ["keks", "kekse", "süssigkeiten"],
      category: Category.sweetsSnacks),
  IconMapping(
      assetFileName: "pepper",
      matchingNames: ["paprika"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "onion",
      matchingNames: ["zwiebel", "schalotte"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "pear",
      matchingNames: ["birne"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "cabbage",
      matchingNames: ["kohl", "wirsing"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "broccoli",
      matchingNames: ["brokkoli", "broccoli", "brokoli"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "eggplant",
      matchingNames: ["aubergine"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "salad",
      matchingNames: [
        "salat",
        "rucola",
        "spinat",
        "mangold",
        "pak choi",
        "pak choy"
      ],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "chocolate",
      matchingNames: ["schokolade", "schokostreusel", "schokoraspel"],
      category: Category.sweetsSnacks),
  IconMapping(
      assetFileName: "ice",
      matchingNames: ["eis", "magnum"],
      category: Category.sweetsSnacks),
  IconMapping(
      assetFileName: "berries",
      matchingNames: [
        "beeren",
        "himbeeren",
        "johannisbeeren",
        "heidelbeeren",
        "blaubeeren",
        "trauben"
      ],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "strawberry",
      matchingNames: ["erdbeere"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "block",
      matchingNames: ["tofu", "butter", "margarine", "rama"],
      category: Category.milkCheese),
  IconMapping(
      assetFileName: "burger",
      matchingNames: ["burger"],
      category: Category.convenienceProductFrozen),
  IconMapping(
      assetFileName: "herbs",
      matchingNames: [
        "kräuter",
        "petersilie",
        "basilikum",
        "koriander",
        "dill",
        "minze"
      ],
      category: Category.spicesCanned),
  IconMapping(
      assetFileName: "pizza_cake",
      matchingNames: ["pizza", "kuchen", "torte", "flammkuchen"],
      category: Category.convenienceProductFrozen),
  IconMapping(
      assetFileName: "yeast",
      matchingNames: ["hefe"],
      category: Category.milkCheese),
  IconMapping(
      assetFileName: "package",
      matchingNames: [
        "backpulver",
        "natron",
        "vanillezucker",
        "trockenhefe",
        "agar-agar",
        "agar agar",
        "puddingpulver",
        "gelierzucker"
      ],
      category: Category.spicesCanned),
  IconMapping(
      assetFileName: "pasta",
      matchingNames: ["nudeln", "spaghetti", "pasta"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "lemon",
      matchingNames: ["zitrone"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "potatos",
      matchingNames: ["kartoffel"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "garlic",
      matchingNames: ["knoblauch"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "spice",
      matchingNames: [
        "salz",
        "pfeffer",
        "gewürz",
        "gewuerz",
        "curry",
        "kurkuma",
        "zimt",
        "kümmel",
        "kuemmel"
      ],
      category: Category.spicesCanned),
  IconMapping(
      assetFileName: "rice",
      matchingNames: ["reis"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "paper_towel",
      matchingNames: ["küchenrolle", "kuechenrolle", "zewa"],
      category: Category.household),
  IconMapping(
      assetFileName: "toilet_paper",
      matchingNames: [
        "klopapier",
        "klo papier",
        "toilettenpapier",
        "toiletten papier"
      ],
      category: Category.household),
  IconMapping(
      assetFileName: "baking_paper",
      matchingNames: ["backpapier", "back papier", "frischhaltefolie"],
      category: Category.household),
  IconMapping(
      assetFileName: "mushroom",
      matchingNames: ["pilz", "champignon"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "papaya",
      matchingNames: ["papaya"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "rhubarb",
      matchingNames: ["rhabarber"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "tetrapack",
      matchingNames: [
        "milch",
        "saft",
        "haferdrink",
        "hafer drink",
        "soja drink",
        "sojadrink",
        "mandeldrink",
        "mandel drink",
        "reisdrink",
        "reis drink",
        "eistee"
      ],
      category: Category.milkCheese),
  IconMapping(
      assetFileName: "egg",
      matchingNames: ["eier"],
      category: Category.milkCheese),
  IconMapping(
      assetFileName: "coffee_beans",
      matchingNames: ["kaffee", "espresso"],
      category: Category.beverages),
  IconMapping(
      assetFileName: "tea",
      matchingNames: ["tee"],
      category: Category.beverages),
  IconMapping(
      assetFileName: "sugar",
      matchingNames: ["zucker"],
      category: Category.spicesCanned),
  IconMapping(
      assetFileName: "cheese",
      matchingNames: [
        "käse",
        "kaese",
        "mozarella",
        "parmesan",
        "gauda",
        "edamer",
        "feta",
        "emmentaler",
        "cheddar",
        "brie",
        "camembert",
        "appenzeller",
        "halloumi",
        "manchego",
        "tilsiter",
        "ricotta",
        "caprice dieux"
      ],
      category: Category.milkCheese),
  IconMapping(
      assetFileName: "asparagus",
      matchingNames: ["spargel"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "gnocchi",
      matchingNames: ["gnocchi"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "pumpkin",
      matchingNames: ["kürbis", "kuerbis", "hokkaido"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "beetroot",
      matchingNames: ["rote bete", "gelbe bete", "rote rübe", "gelbe rübe"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "radish",
      matchingNames: ["radieschen", "radieserl"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "cucumber",
      matchingNames: ["gurke"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "dates",
      matchingNames: ["dattel"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "lime",
      matchingNames: ["limette"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "paper_bag",
      matchingNames: ["tüte", "tuete"],
      category: Category.household),
  IconMapping(
      assetFileName: "raisins",
      matchingNames: ["rosine"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "round_fruit_small",
      matchingNames: [
        "pflaume",
        "aprikose",
        "zwetschge",
        "mirabelle",
        "marille",
        "kiwi"
      ],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "seeds",
      matchingNames: ["kerne", "flocken"],
      category: Category.cereals),
  IconMapping(
      assetFileName: "sponge",
      matchingNames: ["schwamm", "schwämme", "schwaemme"],
      category: Category.household),
  IconMapping(
      assetFileName: "zucchini",
      matchingNames: ["zucchini", "zuchini"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "avocado",
      matchingNames: ["avocado"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "melon",
      matchingNames: ["melone"],
      category: Category.fruitsVegetables),
  IconMapping(
      assetFileName: "tampon",
      matchingNames: ["tampon"],
      category: Category.other)
];
