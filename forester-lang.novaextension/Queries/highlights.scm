(comment) @comment

[
 "("
 ")"
 "{"
 "}"
 "["
 "]"
] @bracket

(p "\\" @tag.framework "p" @tag.framework)
(li "\\" @tag.framework  "li" @tag.framework)
(ul "\\" @tag.framework "ul"  @tag.framework)
(ol "\\" @tag.framework "ol"  @tag.framework)
(author "\\" @tag.framework "author"  @tag.framework)
(author "\\" "author" (_) @string.key)
(title "\\" @tag.framework "title"  @tag.framework)
(inline_math) @string
(display_math) @string
(em "\\" @tag.framework "em"  @tag.framework)
(strong "\\" @tag.framework  "strong" @tag.framework)
(code "\\" @tag.framework  "code" @tag.framework)
(code "\\" "code" (_) @markup.code)
(strong "\\" "strong" (_) @markup.bold)
(em "\\" "em" (_) @markup.italic)
(tex "\\" @tag.framework  "tex" @tag.framework)

(ident "\\" @tag (_) @tag)

(subtree "\\" @string-template "subtree" @string-template)

(transclude address: (_) @string.key)

(import "\\" "import" (_) @string.key)
(export "\\" "export" (_) @string.key)

(def "\\" @keyword "def" @keyword)
(let  "\\" @keyword "let" @keyword)
(object "object" @identifier.constant)
(object self: (_) @keyword)
(method_decl key: (_) @identifier.method)
(patch "patch" @identifier.property)
(patch object: (_) @identifier.constant)

(markdown_link label: (_) @markup.link)
(markdown_link dest: (_) @string.key)
(unlabeled_link (_)  @string.key)

(scope "\\" @keyword "scope" @keyword)
(put "\\" @keyword "put" @keyword)

(query_tree "\\" @string-template "query" @string-template)

(import "\\" @string-template  "import" @string-template)
(export "\\" @string-template  "export" @string-template)
(transclude "\\" @string-template  "transclude" @string-template)