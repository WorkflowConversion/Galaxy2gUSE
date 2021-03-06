<%inherit file="/export_base.mako"/>

<%namespace file="/display_common.mako" import="*" />

<%def name="init()">
<%
    parent.init()
    self.active_view="workflow"
%>
</%def>

<%def name="stylesheets()">
    ${parent.stylesheets()}
    <style>
        .toolForm {
            max-width: 350px;
        }
    </style>
</%def>

<%def name="render_export_to_myexp(item)">
    ##
    ## Renders form for exporting workflow to myExperiment.
    ##
    <h3>Export to myExperiment <em>sandbox</em></h3>
    
    ##def export_to_myexp( self, trans, id, myexp_username, myexp_password ):    
    <div class="toolForm"> 
        <div class="toolFormTitle">Export</div> 
        <form action="${h.url_for( action='export_to_myexp', id=trans.security.encode_id( item.id ) )}" 
                method="POST">
            <div class="form-row"> 
                <label>myExperiment username:</label> 
                <input type="text" name="myexp_username" value="" size="40"/> 
            </div> 
            <div class="form-row"> 
                <label>myExperiment password:</label> 
                <input type="password" name="myexp_password" value="" size="40"/> 
            </div> 
            <div class="form-row"> 
                <input type="submit" value="Export"/> 
            </div> 
        </form> 
    </div>    
</%def>

<%def name="render_download_to_wspgrade_file(item)">
    ##
    ## Renders form for downloading workflow in WS-PGRADE format 
    ##
    <h3>Download to a file as WS-PGRADE workflow</h3>

    <a href="${h.url_for( action='download_to_wspgrade_file', id=trans.security.encode_id( item.id ) )}">
        Download ${get_class_display_name( item.__class__ ).lower()} to a file so that it can be saved for an import to WS-PGRADE (Version gUSE 3.3).</a>
</%def>


<%def name="render_more(item)">
    ## Add form to download workflow in WS-PGRADE format.
    ${self.render_download_to_wspgrade_file(item)}
    ## Add form to export to myExperiment.
    ${self.render_export_to_myexp(item)}
</%def>

<%def name="center_panel()">
    ${parent.body()}
</%def>
