+++
title = "Complete Markdown Syntax Guide"
date = "2026-01-16T11:18:20+08:00"
description = "A comprehensive guide to all Markdown syntax elements with examples"
tags = ["markdown", "syntax", "tutorial", "guide"]
+++

# Complete Markdown Syntax Guide

This is a comprehensive guide to all Markdown syntax elements. Each section includes the syntax and its rendered output.

---

## Table of Contents

1. [Headings](#headings)
2. [Paragraphs](#paragraphs)
3. [Line Breaks](#line-breaks)
4. [Emphasis](#emphasis)
5. [Lists](#lists)
6. [Links](#links)
7. [Images](#images)
8. [Blockquotes](#blockquotes)
9. [Code](#code)
10. [Horizontal Rules](#horizontal-rules)
11. [Tables](#tables)
12. [Task Lists](#task-lists)
13. [Escaping Characters](#escaping-characters)
14. [HTML](#html)
15. [Footnotes](#footnotes)
16. [Strikethrough](#strikethrough)
17. [Highlighting](#highlighting)
18. [Subscript and Superscript](#subscript-and-superscript)
19. [Automatic Links](#automatic-links)
20. [Definition Lists](#definition-lists)

---

## Headings

### ATX Style (using #)

```markdown
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```

### Setext Style (using underline)

```markdown
Heading 1
=========

Heading 2
---------
```

### Heading with Custom ID

```markdown
### My Heading {#custom-id}
```

### Heading with Inline Formatting

```markdown
# Heading *with* **emphasis**
```

---

## Paragraphs

```markdown
This is a paragraph.

This is another paragraph.
```

This is a paragraph.

This is another paragraph.

---

## Line Breaks

### End a line with two or more spaces

```markdown
First line with two spaces at the end.
Second line.
```

First line with two spaces at the end.
Second line.

### Using HTML `<br>` tag

```markdown
First line.<br>Second line.
```

**Note:** The HTML `<br>` tag may not render in all Markdown processors due to security settings.

---

## Emphasis

### Italic (using asterisks or underscores)

```markdown
*italic text*
_italic text_
```

*italic text*
_italic text_

### Bold (using double asterisks or double underscores)

```markdown
**bold text**
__bold text__
```

**bold text**
__bold text__

### Bold and Italic Combined

```markdown
***bold and italic***
___bold and italic___
**_bold and italic_**
__*bold and italic*__
```

***bold and italic***
___bold and italic___
**_bold and italic_**
__*bold and italic*__

---

## Lists

### Unordered Lists

```markdown
- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
- Item 3
```

- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
- Item 3

Alternative using `+` or `*`:

```markdown
* Item 1
+ Item 2
* Item 3
```

### Ordered Lists

```markdown
1. First item
2. Second item
3. Third item
```

1. First item
2. Second item
3. Third item

### Lazy Numbering

```markdown
1. First item
1. Second item
1. Third item
```

1. First item
1. Second item
1. Third item

### Nested Lists

```markdown
1. First level
   - Second level, unordered
     - Third level
   - Back to second level
2. Back to first level
```

1. First level
   - Second level, unordered
     - Third level
   - Back to second level
2. Back to first level

### Definition Lists (Pandoc/PHP Markdown Extra)

```markdown
Term 1
: Definition 1

Term 2
: Definition 2a
: Definition 2b
```

---

## Links

### Inline Links

```markdown
[Link text](https://example.com)
[Link with title](https://example.com "Link title")
```

[Link text](https://example.com)
[Link with title](https://example.com "Link title")

### Reference-style Links

```markdown
[Reference link][ref]
[Another link][another-reference]

[ref]: https://example.com
[another-reference]: https://example.org "Reference with title"
```

### URLs and Email Addresses

```markdown
<https://example.com>
<user@example.com>
```

<https://example.com>
<user@example.com>

### Relative Links

```markdown
[Link to other page](/other-page.md)
[Link to section](#headings)
```

---

## Images

### Inline Images

```markdown
![Alt text](image.png)
![Alt text with title](image.jpg "Image title")
```

### Reference-style Images

```markdown
![Alt text][image-reference]

[image-reference]: image.png
```

### Images with Links

```markdown
[![Alt text](image.png)](https://example.com)
```

### Images with Syntax (dimensions in some implementations)

```markdown
<img src="image.jpg" width="300" height="200" />
```

---

## Blockquotes

### Basic Blockquote

```markdown
> This is a blockquote.
```

> This is a blockquote.

### Multiple Paragraphs

```markdown
> First paragraph.
>
> Second paragraph.
```

> First paragraph.
>
> Second paragraph.

### Nested Blockquotes

```markdown
> First level
>> Second level
>>> Third level
```

> First level
>> Second level
>>> Third level

### Blockquote with Other Elements

```markdown
> ## Heading in blockquote
>
> - List item
> - Another item
>
> Paragraph with **emphasis**
```

> ## Heading in blockquote
>
> - List item
> - Another item
>
> Paragraph with **emphasis**

---

## Code

### Inline Code

```markdown
Use `backticks` for inline code.
```

Use `backticks` for inline code.

### Code Block with Indentation

```markdown
    indented code block
    four spaces or one tab
```

### Fenced Code Blocks

```markdown
```
code without syntax highlighting
```
```

### Code Block with Syntax Highlighting

```markdown
```javascript
function greet(name) {
    console.log(`Hello, ${name}!`);
}
```

```python
def greet(name):
    print(f"Hello, {name}!")
```

```css
body {
    font-family: Arial, sans-serif;
}
```

```bash
echo "Hello World"
```

```html
<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
</head>
<body>
    <h1>Heading</h1>
</body>
</html>
```

```ruby
def greet(name)
  puts "Hello, #{name}!"
end
```

```go
func greet(name string) {
    fmt.Printf("Hello, %s!\n", name)
}
```

```rust
fn greet(name: &str) {
    println!("Hello, {}!", name);
}
```

```java
public void greet(String name) {
    System.out.println("Hello, " + name + "!");
}
```

```cpp
void greet(string name) {
    cout << "Hello, " << name << "!" << endl;
}
```

```csharp
public void Greet(string name) {
    Console.WriteLine($"Hello, {name}!");
}
```

```php
function greet($name) {
    echo "Hello, $name!";
}
```

```sql
SELECT * FROM users WHERE name = 'John';
```

```json
{
    "name": "John",
    "age": 30
}
```

```yaml
name: John
age: 30
```

```toml
name = "John"
age = 30
```

```diff
-old line
+new line
```

### Code with Line Numbers (some implementations)

```markdown
```javascript {.line-numbers}
function hello() {
    console.log("Hello");
}
```
```

---

## Horizontal Rules

```markdown
***
---
___
```

All three render as:

---

---

---

---

## Tables

### Basic Table

```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
```

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

### Table Alignment

```markdown
| Left aligned | Center aligned | Right aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
| Content      | Content        | Content       |
```

| Left aligned | Center aligned | Right aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
| Content      | Content        | Content       |

### Table without Pipes (GFM style)

```markdown
Header 1 | Header 2 | Header 3
---------|----------|----------
Cell 1   | Cell 2   | Cell 3
Cell 4   | Cell 5   | Cell 6
```

### Table with Inline Elements

```markdown
| Header 1 | Header 2 |
|----------|----------|
| **Bold** | *Italic* |
| `code`   | [link](https://example.com) |
```

| Header 1 | Header 2 |
|----------|----------|
| **Bold** | *Italic* |
| `code`   | [link](https://example.com) |

---

## Task Lists

```markdown
- [x] Completed task
- [ ] Incomplete task
- [ ] Task with subitems
  - [x] Completed subtask
  - [ ] Incomplete subtask
```

- [x] Completed task
- [ ] Incomplete task
- [ ] Task with subitems
  - [x] Completed subtask
  - [ ] Incomplete subtask

---

## Strikethrough (GFM)

```markdown
~~Strikethrough text~~
```

~~Strikethrough text~~

---

## Highlighting (some implementations)

```markdown
==Highlighted text==
```

==Highlighted text==

---

## Footnotes (Pandoc, PHP Markdown Extra)

```markdown
This is a statement with a footnote[^1].

[^1]: This is the footnote content.

You can have multiple footnotes[^2] and reference them multiple times[^2].

[^2]: This is the second footnote.
```

This is a statement with a footnote[^1].

[^1]: This is the footnote content.

You can have multiple footnotes[^2] and reference them multiple times[^2].

[^2]: This is the second footnote.

### Inline Footnotes (Pandoc)

```markdown
This is an inline footnote.^[Inline footnote content]
```

---

## Subscript and Superscript (Pandoc)

```markdown
H~2~O (subscript)
E=mc^2^ (superscript)
```

H~2~O (subscript)
E=mc^2^ (superscript)

---

## Escaping Characters

To display literal Markdown characters, escape them with backslash:

```markdown
\*not italic\*
\_not italic_
\[not a link\](not a url)
\`not code\`
```

\*not italic\*
\_not italic_
\[not a link\](not a url)
\`not code\`

### Escapable Characters

```markdown
\   backslash
`   backtick
*   asterisk
_   underscore
{}  curly braces
[]  square brackets
()  parentheses
#   hash mark
+   plus sign
-   minus sign (hyphen)
.   dot
!   exclamation mark
```

---

## HTML

Markdown supports inline HTML. Here are some examples:

```markdown
<div style="color: red;">Red text</div>

<table>
    <tr>
        <td>HTML table</td>
    </tr>
</table>

<!-- HTML comment -->
```

**Note:** HTML rendering depends on your Markdown processor configuration. Some processors may strip or escape HTML for security reasons.

### HTML Attributes in Markdown (some implementations)

```markdown
## Heading {.class-name #id-name}

[Link]{#id .class-name}

![Image]{#id .class-name width="300"}
```

---

## Automatic Extensions

### Abbreviations (PHP Markdown Extra)

```markdown
*[HTML]: Hyper Text Markup Language
*[CSS]: Cascading Style Sheets

We use HTML and CSS.
```

*[HTML]: Hyper Text Markup Language
*[CSS]: Cascading Style Sheets

We use HTML and CSS.

### Math (KaTeX, MathJax)

```markdown
Inline math: $E=mc^2$

Block math:
$$
\frac{n!}{k!(n-k)!} = \binom{n}{k}
$$
```

Inline math: $E=mc^2$

Block math:
$$
\frac{n!}{k!(n-k)!} = \binom{n}{k}
$$

### CriticMarkup (for document editing)

```markdown
This is {++added++} text.
This is {--deleted--} text.
This is {~~substituted~>replacement~~} text.
This is {==highlighted==} text.
{>>This is a comment<<}
```

### Emoji (some implementations)

```markdown
:smile: :heart: :thumbsup:
```

:smile: :heart: :thumbsup:

---

## Advanced Combinations

### Lists with Code

```markdown
1. Item with `inline code`
2. Item with block code:

   ```python
   print("Hello")
   ```
```

### Blockquotes with Lists

```markdown
> A blockquote with a list:
> - Item 1
> - Item 2
```

> A blockquote with a list:
> - Item 1
> - Item 2

### Tables with Multiple Lines

```markdown
| Column 1 | Column 2 |
|----------|----------|
| Line 1<br>Line 2 | Content |
```

---

## Best Practices

1. **Consistency**: Use one style consistently throughout your document
2. **Readability**: Keep line lengths reasonable (80-100 characters)
3. **Spacing**: Add blank lines between different elements
4. **Escaping**: Escape special characters when you want them literal
5. **Accessibility**: Use meaningful alt text for images
6. **Links**: Use descriptive link text, not "click here"

---

## Quick Reference

| Element | Syntax | Example |
|---------|--------|---------|
| Heading | `#` | `# Heading` |
| Bold | `**` or `__` | `**bold**` |
| Italic | `*` or `_` | `*italic*` |
| Strikethrough | `~~` | `~~text~~` |
| Link | `[text](url)` | `[link](url)` |
| Image | `![alt](url)` | `![alt](url)` |
| Code | `` ` `` or ` ``` ` | `` `code` `` |
| Blockquote | `>` | `> quote` |
| List | `-` or `1.` | `- item` |
| Table | `\|` | `\| col \|` |
| Horizontal rule | `---` or `***` | `---` |

---

## Conclusion

This guide covers all major Markdown syntax elements. Different Markdown implementations (CommonMark, GitHub Flavored Markdown, Pandoc, PHP Markdown Extra) may support additional features or have slight variations.

For the best compatibility, use CommonMark or GitHub Flavored Markdown (GFM) syntax.

---

**Resources:**
- [CommonMark Spec](https://spec.commonmark.org/)
- [GitHub Flavored Markdown](https://github.github.com/gfm/)
- [Markdown Guide](https://www.markdownguide.org/)
