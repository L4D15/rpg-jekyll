---
layout: post
title:  "How to write posts"
date:   2019-04-27
---

1. Create a `.md` file under the appropriate folder.
2. Add the required YAML front matter at the start (use an already existing article for reference)
3. Write using Markdown syntax.
4. Profit.

RPG Jekyll uses [kramdown](https://kramdown.gettalong.org/documentation.html) to convert [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) syntax to HTML, which is then styled using [Bootstrap](https://getbootstrap.com/docs/4.0/getting-started/introduction/). Check the documentation for each one if you want to do something not implemented, but the core concepts are the following:

- You can insert HTML code, but be careful not to break the page layout.
- If you add custom HTML code and want something inside to be parsed as Markdown, add `markdown="1"` to the container.
- Kramdown allows to apply custom classes by appending `{:.your-class-name}` after an element.

# Advanced Features

Using a combination of pre-built funcionality and custom HTML code we can achieve great results with little to no effort.

## Automatic linking

Write the title of any other page in your site and it will automatically be converted to a link to that page. The link search is case sentitive, so take that into account if a link is not generated. 

Example:
- Siege of Dragon Keep
- Deck of Many Things

## Images

Use the normal markdown syntax for images `![Name of the image](url)`. You can use images from the web by their URL or use your own images from the `assets` folder.

### From Internet

```
![Image from Internet](https://i.imgur.com/ESVU8ak.gif)
```

![Image from Internet](https://i.imgur.com/ESVU8ak.gif)

### From Assets folder

```
![Image from Assets](/assets/img/stories/siege_dragon_keep.jpg)`
```

![Image from Assets](/assets/img/stories/siege_dragon_keep.jpg)

## Floating Images

![Floating Image](/assets/img/default.png)
{:.float-md-right}

We can also add images that will float to the right of the text. Just add `{.float-md-right}` after the image code. 

On mobile devices the image will be centered and inserted between the text instead of floating. 

Check [Bootstrap documentation](https://getbootstrap.com/docs/4.0/utilities/float/) rewarding the float funcionality for other options.

## Tables

| Header A | Header B | Header C |
|:---------|:--------:|---------:|
| This     | is       | awesome  |
| it       | even     | supports |
| striped  | style.   | Yeah!    |

## Info boxes

The Markdown syntax for a quote will render an info box. There are several styles of boxes, so choose whatever best suits the content that will be inside the box, whether is text to read-out-loud or a warning to not forget something when playing.

>This is a normal box

>This is a danger box. We added `{:.alert-danger}` at the end so kramdown adds that Bootstrap class to the box and becomes red. There are more colors, check [Bootstrap documentation](https://getbootstrap.com/docs/4.0/components/alerts/) for a complete list.
{:.alert-danger}

## Custom HTML

Adding custom HTML code allows you to display content in many different ways, but can break you site layout, do it with care.

### Columns

There is no easy way to get content to be split into columns automatically, so you will have to do it using HTML and Bootstrap directly. Here's an example on how to do it.

<div class="row">
<div markdown="1" class="col-md-4 col-sm-12">
This is the first column. If you want the content to be parsed as Markdown and converted to proper HTML, remember to include the `markdown="1"` property in the container. 

Also, don't indent the HTML code nor the Markdown content within or it will not be parsed.
</div>
<div markdown="1" class="col-md-4 col-sm-12">
Also, make sure to use Bootstrap responsive layout so columns are properly positioned for every device. For three columns we've used `col-md-4 col-sm-12` so it is shown as three columns in medium-size devices or higher, but as a single column on mobile devices.
</div>
<div markdown="1" class="col-md-4 col-sm-12">
Take a look at Bootstrap documentation about layouts and familiarize with the concept. That will allow you to accomplish more complex layouts without breaking your site in mobile devices.
</div>
</div>

### Advanced columns

Once we are adding HTML directly, we can do many, many things, like non-equal columns with different styles.

<div class="row">

<div markdown="1" class="col-md-6 col-sm-12">
This column uses 6 out of 12 _column slots_, so it is larger than the others. We can use the extra space to add an image, for example.

![Shadow Dale](/assets/img/locations/shadowdale.jpg)
</div>

<div markdown="1" class="col-md-4 col-sm-12 card text-white bg-primary p-2">
This is a smaller column with a different style, because why not.
</div>

<div markdown="1" class="col-md-2 col-sm-12 card text-white bg-secondary p-2">
We can also style each column differently by adding different classes or styles to the container.
</div>

</div>

## Table of Contents

If you add a first-level header (the single `#`) to an article, a table of contents of all the headings and sections of the article will be displayed on the side. This is specially useful for long articles, and supports indexing up to third level heading.

For example, an article with the following:

```
# Header 1
## Header 1.1
### Header 1.1.1
# Header 2
## Header 2.2
```

Will generate the following table of contents on the side:

- Header 1
    - Header 1.1
        - Header 1.1.1
- Header 2
    - Header 2.1

Only locations, rules and stories will display the table of contents, as characters and items display other information on the sidebar, and sessions (`_posts`) are not expected to be that long.