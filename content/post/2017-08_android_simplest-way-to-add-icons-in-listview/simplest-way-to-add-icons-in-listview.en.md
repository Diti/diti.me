---
title: The simplest way to include icons in a ListView
date: 2016-09-12T14:59:18+02:00
description:
  "Did you know you don’t have to fiddle with custom layouts to setup a ListView with icons?"
tags: [android]
---

{{< figure
  class="is-pulled-right"
  alt="Screenshot of the final result"
  src="/img/2017-08_android_simplest-way-to-add-icons-in-listview/screenshot-imagemenu-final_thumb.png"
  link="/img/2017-08_android_simplest-way-to-add-icons-in-listview/screenshot-imagemenu-final_full.png"
  caption="Did you know you don’t have to fiddle with custom layouts to get such a result?"
>}}

At my current job, I have been asked to merge my application with a legacy
project, already approved by marketing. During normal use, the application would
display a navigation [`ListView`](https://developer.android.com/guide/topics/ui/layout/listview.html)
at launch.

This post will explain how I set up such a list, to act as a reminder
whenever I need to quickly implement it again.

To achieve this result quickly and painlessly, I used a combination of
_compound drawables_, and Android’s built-in list layouts.

## How it works

  1. [Create a structure which represents the menu items]({{< ref "#step-1" >}});
  2. [Create a list of these menu items, and populate it]({{< ref "#step-2" >}});
  3. [Place a `ListView` in one of your layouts]({{< ref "#step-3" >}});
  4. [Make the link between the item list and the `ListView`, using an `Adapter`]({{< ref "#step-4" >}});
  5. [Implement the navigation and UX]({{< ref "#step-5" >}}).

### Represent the menu items {#step-1}

A “menu” item is a combination of a picture (drawable) and a text.
This information is represented as an
[`ImageMenuItem`](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuitem-java)
entity.

In accordance with Android’s best coding practices, text is stored as a
[string resource](https://developer.android.com/guide/topics/resources/string-resource.html),
easily translatable and maintainable.

### Create a list of menu items {#step-2}

In [the `Activity`](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-mainactivity-java),
create an `ArrayList` of these items:

``` java
private final ArrayList<ImageMenuItem> menuItems = new ArrayList<>();
```

In the `Activity`’s `onCreate` method, populate this list using
[`ArrayList.add`](https://docs.oracle.com/javase/7/docs/api/java/util/ArrayList.html#add%28int,%20E%29):

``` java
static final int ITEM_FIRST = 0;
static final int ITEM_SECOND = 1;

menuItems.add(ITEM_FIRST, new ImageMenuItem(R.drawable.ic_first, R.string.menuitem_first));
menuItems.add(ITEM_SECOND, new ImageMenuItem(R.drawable.ic_second, R.string.menuitem_second));
```

### Place a ListView {#step-3}

(And make sure you know its id.)

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

### Link the data to the ListView using an adapter {#step-4}

``` java
final ListView listView = (ListView)findViewById(R.id.listView);
listView.setAdapter(new ImageMenuAdapter(this, menuItems));
```

**All the magic happens in the [`ImageMenuAdapter`](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuadapter-java):**

  1. Tell the `Adapter` to
     [use Android’s default `simple_list_item_1`](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuadapter-java-L19), and
  2. Set the text, and
     [set a compound drawable to the list item](https://gist.github.com/Diti/6ad5167f4ebc53a7cf342697c21effea#file-imagemenuadapter-java-L28-L29).

### Implement the navigation {#step-5}

The reason we [previously declared constants]({{< ref "#step-2" >}}) for the
menu items, is to properly handle navigation:

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

For those who would rather read actual code:

{{< gist Diti 6ad5167f4ebc53a7cf342697c21effea "ImageMenuItem.java" >}}
{{< gist Diti 6ad5167f4ebc53a7cf342697c21effea "ImageMenuAdapter.java" >}}
{{< gist Diti 6ad5167f4ebc53a7cf342697c21effea "MainActivity.java" >}}
