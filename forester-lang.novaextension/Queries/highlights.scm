(comment) @comment

[
 "\\" 
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
(title "\\" @tag.framework "title"  @tag.framework)
(inline_math) @string
(display_math) @string
(em "\\" @tag.framework "em"  @tag.framework)
(strong "\\" @tag.framework  "strong" @tag.framework)
(code "\\" @tag.framework  "code" @tag.framework)

(tex "\\" @tag.framework  "tex" @tag.framework)

(ident "\\" @tag (text) @tag)

(subtree "subtree" @identifier.function)

(transclude "transclude" @definition.package)
(transclude address: (_) @string.key)

(def "def" @keyword)
(let "let" @keyword)
(object "object" @identifier.constant)
(object self: (_) @keyword)
(method_decl key: (_) @identifier.method)
(patch "patch" @identifier.property)
(patch object: (_) @identifier.constant)

(markdown_link label: (_) @markup.link)
(markdown_link dest: (_) @string.key)
(unlabeled_link (external_link)) @string.key

(scope "scope" @definition.class)
(put "put" @identifier.variable)

(query_tree "query" @keyword)

(import "import" @definition.package)
(export "export" @definition.package)
(transclude "transclude" @definition.package)


(li (text) @spell)
(em (text) @spell)
(strong (text) @spell)
(markdown_link label: (text) @spell)
(method_decl value: (method_body (text) @spell))