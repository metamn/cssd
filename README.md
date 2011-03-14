# CSS documentation generator

A small Ruby executable (shell) script to generate HTML documentation for CSS files.

More exactly:

  1. It takes a .css file
  2. Takes all comments in Markdown format and generates a HTML
  
## Why?

* There are no proper CSS documenting tools.
* It is more straightforward to document your frontend code in CSS than in HTML

## Based on

  1. rdiscount
  
## Usage

Comment your CSS as usual but use [Markdown](http://daringfireball.net/projects/markdown/syntax ) instead of plain text.

Example:
  
    /*
    documentation line 1
    documentation line 2
    */ 
    
Then run `cssd` on your CSS file. It will generate a HTML file named as your CSS.

## Examples

Check the `base.css` and `base.html` files. The first was the input, the second the output.


## Licence

MIT
