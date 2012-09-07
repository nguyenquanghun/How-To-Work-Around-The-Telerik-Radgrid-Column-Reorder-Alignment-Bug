How-To-Work-Around-The-Telerik-Radgrid-Column-Reorder-Alignment-Bug
===================================================================

When you set ReorderColumnsOnClient to true on the Telerik RadGrid and swap columns with different 
ItemStyle-HorizontalAlign settings, that alignment is not swapped with the column data.

There is a [work around](http://www.telerik.com/community/forums/aspnet-ajax/grid/horizontalalign-on-client-columns-reorder.aspx)
on the Telerik support forums, but it involves using GridTemplateColumn instead of GridBoundColumn or which ever other type
may be more appropriate for your needs.

I wasn't happy with this as I'm maintaining a page with 1000's or lines of code (not my app) plus 1000's of lines of js code (again, 
not my app).  I didn't want to get into changing the cells and trying to find all the code which might've been broken, so I created 
this js function to resolve it unintrusively.

The commit log is fairly clean if you want to see the line of thinking which went into this fix.