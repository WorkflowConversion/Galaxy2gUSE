##
## Generate the XML for WS-PGRADE.
##
<%!
    from xml.sax.saxutils import escape
    import textwrap
%>
## Generate request.
<?xml version="1.0" encoding="UTF-8" standalone="no"?>  
<workflow download="all" export="proj" mainabst="" maingraf="${ workflow_name }" mainreal="${ workflow_name}" name="${ workflow_name }">
   ${ workflow_content }
</workflow>
