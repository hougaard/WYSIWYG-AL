
var InputArea
var Editor

function Init() {

    var div = document.getElementById("controlAddIn");
    InputArea = document.createElement("textarea");
    InputArea.id = "Comment";
    InputArea.name = "Comment";
    div.appendChild(InputArea);
    
    ClassicEditor
        .create(document.querySelector('#Comment'))
        .then(editor => {
            console.log(editor);
            Editor = editor;
            console.log(Editor);
            editor.model.document.on( 'change:data', () => {
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ContentChanged",[]);    
            } );
        })
        .catch(error => {
            console.error(error);
        });
}

function Load(data) {
    InputArea.value = data;   
}

function RequestSave() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveRequested",[Editor.getData()]);
}