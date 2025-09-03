<!--typst-begin-exclude--> 
<center>

# Package Name
Short description, no longer than two lines.

</center>
<style>
dl dt type {background: #ddd; padding: 1px 3px}
[data-required] {}
</style>
<!--typst-end-exclude-->

<!--raw-typst
#v(-1em)
-->

## Options

<dl data-arg>
  <dt>
    <code data-lang="typ">#feature.foo(value)</code>
    <!-- zwj and larr entities are equivalent to the input arrow -->
    &zwj; <type>string</type> <type>content</type>
    <em>[required]</em>
  </dt>
  <dd>Receives a value.</dd>
  
  <!-- rarr entity is equivalent to the output arrow -->
  <dt><code data-lang="typ">#feature()</code> &rarr; <type>content</type></dt>
  <dd>Returns a value.</dd>
  
  <dt><code data-lang="typ">#set feature()</code> &rarr; <type>nothing</type></dt>
  <dd>Returns nothing.</dd>
  
  <dt>
    <code data-lang="typ">#feature.bar(value)</code>
    &zwj; <type>content</type> <type>none</type>
    &rarr; <type>content</type> <type>string</type>
  </dt>
  <dd>Receives a value and returns a value.</dd>
</dl>

## Terms

<dl>
  <dt>Title</dt>
  <dd>Description.</dd>
  <dt>Title</dt>
  <dd>Description.</dd>
</dl>

## Inline code

<code data-lang="typ">#feature()</code>