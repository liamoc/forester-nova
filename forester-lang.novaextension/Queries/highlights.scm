(link_title) @markup.string
(link_destination) @markup.link

(link_label
  "[" @markup.link-label.bracket
  "]" @markup.link-label.bracket
  ) @markup.link-label
((link_label
  "[" @markup.link-label.bracket
  "]" @markup.link-label.bracket
  ) @markup.link-label.value.number
  (#match? @markup.link-label.value.number "^\\[\\d+\\]$")
)