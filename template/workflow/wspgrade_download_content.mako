##
## Generate the content block for WS-PGRADE.
##
<%!
    from xml.sax.saxutils import escape
%>
    <graf name="${ workflow_name }" text="Description of Graph">
    %for step_num, step in workflow_steps.items():
        %if step['type'] == 'tool' or step['type'] is None:
           <job name="${step['name']}${step['tool_version']}" text="${step['annotation']}" x="${step['position']['left']}" y="${step['position']['top']}">
           %for input_name, input_connection in step['input_connections'].items():
              <input name="${input_name}" prejob="${input_connection['prejob']}" preoutput="${input_connection['preoutput']}" seq="${input_connection['idinput']}" text="Description of Port" x="${input_connection['x']}" y="${input_connection['y']}"/>
           %endfor
           %for output in step['outputs']:
              <output name="${output['name']}" seq="${output['id']}" text="Description of Port" x="${output['x']}" y="${output['y']}"/>
           %endfor
           </job>
        %endif
    %endfor
    </graf>
    <real abst="" graf="${ workflow_name }" name="${ workflow_name }" text="${ workflow_description }">
    %for step_num, step in workflow_steps.items():
        %if step['type'] == 'tool' or step['type'] is None:
           <job name="${step['name']}${step['tool_version']}" text="${step['annotation']}" x="${step['position']['left']}" y="${step['position']['top']}">
           %for input_name, input_connection in step['input_connections'].items():
              <input name="${input_name}" prejob="${input_connection['prejob']}" preoutput="${input_connection['preoutput']}" seq="${input_connection['idinput']}" text="Description of Port" x="${input_connection['x']}" y="${input_connection['y']}"/>
           %endfor
           %for output in step['outputs']:
              <output name="${output['name']}" seq="${output['id']}" text="Description of Port" x="${output['x']}" y="${output['y']}"/>
           %endfor
           %if len(step['inputs']) > 0:
              <execute desc="null" inh="null" key="params" label="null" value="${step['param']}"/>
           %endif
           </job>
        %endif
    %endfor
    </real>
