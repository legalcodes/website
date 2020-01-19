---
title: Create and style a text field
prev:
  title: Build a form with validation
  path: /docs/cookbook/forms/validation
next:
  title: Handle changes to a text field
  path: /docs/cookbook/forms/text-field-changes
---

Text fields allow users to type text into an app.
They are used to build forms,
send messages, create search experiences, and more.
In this recipe, explore how to create and style text fields.

Flutter provides two text fields:
[`TextField`][] and [`TextFormField`][].

## `TextField`

[`TextField`][] is the most commonly used text input widget.

By default, a `TextField` is decorated with an underline.
You can add a label, icon, inline hint text, and error text by supplying an
[`InputDecoration`][] as the [`decoration`][]
property of the `TextField`.
To remove the decoration entirely (including the
underline and the space reserved for the label),
set the `decoration` to null.

<!-- skip -->
```dart
TextField(
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Enter a search term'
  ),
);
```

To retrieve the value when it changes,
see the [Handle changes to a text field][] recipe.

## `TextFormField`

[`TextFormField`][] wraps a `TextField` and integrates it
with the enclosing [`Form`][].
This provides additional functionality,
such as validation and integration with other
[`FormField`][] widgets.

<!-- skip -->
```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Enter your username'
  ),
);
```

For more information on input validation, see the
[Building a form with validation][] recipe.


[Building a form with validation]: /docs/cookbook/forms/validation/
[`decoration`]: {{site.api}}/flutter/material/TextField/decoration.html
[`Form`]: {{site.api}}/flutter/widgets/Form-class.html
[`FormField`]: {{site.api}}/flutter/widgets/FormField-class.html
[Handle changes to a text field]: /docs/cookbook/forms/text-field-changes/
[`InputDecoration`]: {{site.api}}/flutter/material/InputDecoration-class.html
[`TextField`]: {{site.api}}/flutter/material/TextField-class.html
[`TextFormField`]: {{site.api}}/flutter/material/TextFormField-class.html
