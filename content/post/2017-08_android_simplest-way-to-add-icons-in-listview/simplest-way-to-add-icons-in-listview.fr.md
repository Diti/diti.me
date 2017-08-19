---
title: Une manière simple d’ajouter des icônes à une ListView
date: 2016-09-12T14:59:18+02:00
description:
  "Did you know you don’t have to fiddle with custom layouts to setup a ListView with icons?"
tags: [android]
---

{{< figure
  class="is-pulled-right"
  alt="Capture d’écran du résultat final"
  src="/img/2017-08_android_simplest-way-to-add-icons-in-listview/screenshot-imagemenu-final_thumb.png"
  link="/img/2017-08_android_simplest-way-to-add-icons-in-listview/screenshot-imagemenu-final_full.png"
  caption="Saviez-vous que l’on peut obtenir ce résultat sans utiliser de “custom layout” ?"
>}}

À Gemalto, l’une de mes missions a été de fusionner mon application avec un ancien
projet, déjà approuvé par l’équipe marketing. En lançant l’application, on tomberait
sur une [`ListView`](https://developer.android.com/guide/topics/ui/layout/listview.html)
qui sert à naviguer dans les différents écrans de l’application.

Pour arriver à ce résultat rapidement et sans trop d’efforts, j’ai utilisé une combinaison
de _compound drawables_ et des _layouts_ par défaut d’Android.

## Comment ça marche

  1. [Créer une structure qui représente les éléments du menu]({{< ref "#step-1" >}}) ;
  2. [Créer une liste (le menu) et y ajouter des éléments]({{< ref "#step-2" >}}) ;
  3. [Mettre en place une `ListView` dans un des _layouts_]({{< ref "#step-3" >}}) ;
  4. [Faire le lien entre le menu et la `ListView`, en utilisant un `Adapter`]({{< ref "#step-4" >}}) ;
  5. [Implémenter la navigation]({{< ref "#step-5" >}}).

### Représenter les éléments du menu {#step-1}

Chaque élément du menu est une combinaison d’une image (_drawable_) et d’une chaîne de caractères. 
Cette information sera représentée sous la forme d’un objet [`ImageMenuItem`](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuitem-java).

Comme recommandé par Google, la chaîne de caractères est stockée en tant que [_string resource_](https://developer.android.com/guide/topics/resources/string-resource.html),
afin qu’elle soit facile à traduire et à modifier.

### Créer une liste d’éléments du menu {#step-2}

Dans [l’`Activity`](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-mainactivity-java),
on crée l’`ArrayList` qui stockera tous les éléments:

``` java
private final ArrayList<ImageMenuItem> menuItems = new ArrayList<>();
```

Dans la méthode `onCreate()` de cette `Activity`, on remplit cette liste en utilisant
[`ArrayList.add`](https://docs.oracle.com/javase/7/docs/api/java/util/ArrayList.html#add%28int,%20E%29):

``` java
static final int ITEM_FIRST = 0;
static final int ITEM_SECOND = 1;

menuItems.add(ITEM_FIRST, new ImageMenuItem(R.drawable.ic_first, R.string.menuitem_first));
menuItems.add(ITEM_SECOND, new ImageMenuItem(R.drawable.ic_second, R.string.menuitem_second));
```

### Mettre en place une `ListView` {#step-3}

(S’assurer qu’elle soit dotée d’un `android:id`.)

``` xml
<?xml version="1.0" encoding="utf-8"?>
<ListView
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/listView"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    />
```

### Lier le menu à la `ListView` {#step-4}

``` java
final ListView listView = (ListView)findViewById(R.id.listView);
listView.setAdapter(new ImageMenuAdapter(this, menuItems));
```

**Toute la magie de cette solution se situe dans [`ImageMenuAdapter`](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuadapter-java):**

  1. Dire à l’`Adapter` d’utiliser [le `simple_list_item_1` d’Android](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuadapter-java-L19), et
  2. Définir la chaîne de caractères, et [ajouter un _compound drawable_ à chaque élément](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuadapter-java-L28-L29).

### Implémenter la navigation {#step-5}

Si l’on a [défini des constantes auparavant]({{< ref "#step-2" >}}), c’est pour que
la navigation soit simple à gérer :

``` java
listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
        switch (position) {
            case ITEM_SECOND:
                // Do whatever you want here
                break;
            default:
                Log.w("ImageMenu", "Menu item at position #" + position + " not yet implemented");
        }
    }
});
```

---

Pour ceux d’entre vous qui préfèrent lire du code :

{{< gist Diti 6ad5167f4ebc53a7cf342697c21effea "ImageMenuItem.java" >}}
{{< gist Diti 6ad5167f4ebc53a7cf342697c21effea "ImageMenuAdapter.java" >}}
{{< gist Diti 6ad5167f4ebc53a7cf342697c21effea "MainActivity.java" >}}
