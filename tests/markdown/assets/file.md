<!--typst-begin-exclude--> 
<center>

# Package Name
Short description, no longer than two lines.

</center>
<!--typst-end-exclude-->

<!--raw-typst
#v(-1em)
-->

```typst
#feature(
  title,
  date: datetime.today(),
  color: rgb("#FFF"),
  size: 1cm
)
```

## Options
Special `#arg` syntax for `<dl>` is rendered:

<dl id="arg">
  <dt><code class="typ">#feature()</code> &rarr; content</dt>
  <dd>Does something.</dd>
  
  <dt><code>title:</code> &larr; string | content [required]</dt>
  <dd>Set title.</dd>
  
  <dt><code>date:</code> &larr; datetime</dt>
  <dd>Set date.</dd>
  
  <dt><code>color:</code> &larr; rgb | luma</dt>
  <dd>Set color.</dd>
  
  <dt><code>size:</code> &larr; length</dt>
  <dd>Set size.</dd>
</dl>

## Terms
Common `<dl>` are rendered as:

<dl>
  <dt>Title</dt>
  <dd>Description.</dd>
  <dt>Title</dt>
  <dd>Description.</dd>
</dl>

## Inline code
And inline `<code class="typ">` is rendered: <code class="typ">#feature()</code>.